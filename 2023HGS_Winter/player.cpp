//=============================================================================
// 
//  プレイヤー処理 [player.cpp]
//  Author : 相馬靜雅
// 
//=============================================================================
#include "game.h"
#include "player.h"
#include "camera.h"
#include "manager.h"
#include "debugproc.h"
#include "renderer.h"
#include "input.h"
#include "enemy.h"
#include "calculation.h"
#include "score.h"
#include "texture.h"
#include "Xload.h"
#include "model.h"
#include "hp_gauge.h"
#include "objectChara.h"
#include "elevation.h"
#include "shadow.h"
#include "particle.h"
#include "3D_Effect.h"
#include "ballast.h"
#include "impactwave.h"
#include "sound.h"
#include "enemymanager.h"
#include "bullet.h"
#include "stage.h"
#include "objectX.h"
#include "instantfade.h"
#include "fade.h"
#include "listmanager.h"
#include "object_circlegauge2D.h"
#include "collisionobject.h"
#include "limitereamanager.h"
#include "beam.h"
#include "santabag.h"
#include "meshsphere.h"
#include "universal.h"

//==========================================================================
// 定数定義
//==========================================================================
namespace
{
	const char* CHARAFILE = "data\\TEXT\\character\\player\\motion_santa.txt";	// キャラクターファイル
	const float JUMP = 20.0f * 1.5f;	// ジャンプ力初期値
	const int INVINCIBLE_INT = 2;		// 無敵の間隔
	const int INVINCIBLE_TIME = 90;		// 無敵の時間
	const int DEADTIME = 120;			// 死亡時の時間
	const int FADEOUTTIME = 60;			// フェードアウトの時間
	const int MAX_ATKCOMBO = 2;			// 攻撃コンボの最大数
	const int INTERVAL_ATK = 15;		// 攻撃の猶予
	const int MAX_BUFFSTATUS = 100;		// ステータスのバフ最大値
}

//==========================================================================
// 静的メンバ変数宣言
//==========================================================================

//==========================================================================
// コンストラクタ
//==========================================================================
CPlayer::CPlayer(int nPriority) : CObjectChara(nPriority)
{
	// 値のクリア
	// 共有変数
	m_bJump = false;					// ジャンプ中かどうか
	m_bLandOld = false;					// 過去の着地情報
	m_bHitStage = false;				// ステージの当たり判定
	m_bLandField = false;				// フィールドの着地判定
	m_bHitWall = false;					// 壁の当たり判定
	m_nCntWalk = 0;						// 歩行カウンター
	m_state = STATE_NONE;				// 状態
	m_pMotion = NULL;					// モーションの情報
	m_sMotionFrag.bATKR = false;			// モーションのフラグ
	m_sMotionFrag.bATKL = false;			// モーションのフラグ
	m_sMotionFrag.bJump = false;		// モーションのフラグ
	m_sMotionFrag.bKnockBack = false;	// モーションのフラグ
	m_sMotionFrag.bDead = false;		// モーションのフラグ
	m_sMotionFrag.bMove = false;		// モーションのフラグ

	// プライベート変数
	m_pSnowBallL = nullptr;							// 左の雪玉
	m_pSnowBallR = nullptr;							// 右の雪玉
	m_pMtxSnowBallL = nullptr;						// 左の雪玉持つ用のポインタ
	m_pMtxSnowBallR = nullptr;						// 右の雪玉持つ用のポインタ
	m_Oldstate = STATE_NONE;						// 前回の状態
	m_mMatcol = mylib_const::DEFAULT_COLOR;			// マテリアルの色
	m_posKnokBack = mylib_const::DEFAULT_VECTOR3;	// ノックバックの位置
	m_KnokBackMove = mylib_const::DEFAULT_VECTOR3;	// ノックバックの移動量
	m_nCntState = 0;								// 状態遷移カウンター
	m_nMyPlayerIdx = 0;								// プレイヤーインデックス番号
	m_pShadow = NULL;								// 影の情報
	m_pTargetP = NULL;								// 目標の地点
}

//==========================================================================
// デストラクタ
//==========================================================================
CPlayer::~CPlayer()
{

}

//==========================================================================
// 生成処理
//==========================================================================
CPlayer *CPlayer::Create(int nIdx)
{
	// 生成用のオブジェクト
	CPlayer *pPlayer = NULL;

	if (pPlayer == NULL)
	{// NULLだったら

		// メモリの確保
		pPlayer = DEBUG_NEW CPlayer;

		if (pPlayer != NULL)
		{// メモリの確保が出来ていたら

			// プレイヤーインデックス番号
			pPlayer->m_nMyPlayerIdx = nIdx;

			// 初期化処理
			pPlayer->Init();
		}

		return pPlayer;
	}

	return NULL;
}

//==========================================================================
// 初期化処理
//==========================================================================
HRESULT CPlayer::Init(void)
{
	// 種類の設定
	SetType(TYPE_PLAYER);

	m_state = STATE_NONE;	// 状態
	m_nCntState = 0;		// 状態遷移カウンター
	m_bLandOld = true;		// 前回の着地状態

	// キャラ作成
	HRESULT hr = SetCharacter(CHARAFILE);

	if (FAILED(hr))
	{// 失敗していたら
		return E_FAIL;
	}

	// モーションの生成処理
	m_pMotion = CMotion::Create(CHARAFILE);

	// オブジェクトキャラクターの情報取得
	CObjectChara *pObjChar = GetObjectChara();

	// モーションの設定
	m_pMotion->SetModel(pObjChar->GetModel(), pObjChar->GetNumModel(), CObjectChara::GetObjectChara());

	// 位置取得
	D3DXVECTOR3 pos = GetPosition();

	// 影の生成
	m_pShadow = CShadow::Create(pos, 50.0f);

	// ポーズのリセット
	m_pMotion->ResetPose(MOTION_DEF);

	return S_OK;
}

//==========================================================================
// 終了処理
//==========================================================================
void CPlayer::Uninit(void)
{
	if (m_pMotion != NULL)
	{
		m_pMotion->Uninit();
		delete m_pMotion;
		m_pMotion = NULL;
	}

	// 影を消す
	if (m_pShadow != NULL)
	{
		//m_pShadow->Uninit();
		m_pShadow = NULL;
	}

	// 右の雪玉を消す
	if (m_pSnowBallR != nullptr)
	{
		m_pSnowBallR->Uninit();
		m_pSnowBallR = nullptr;
	}

	// 左の雪玉を消す
	if (m_pSnowBallL != nullptr)
	{
		m_pSnowBallL->Uninit();
		m_pSnowBallL = nullptr;
	}

	// 終了処理
	CObjectChara::Uninit();

	// モード別終了処理
	UninitByMode();
}

//==========================================================================
// モード別終了処理
//==========================================================================
void  CPlayer::UninitByMode(void)
{
	CScene *pScene = CManager::GetInstance()->GetScene();
	if (pScene != NULL)
	{
		// プレイヤーをNULL
		CManager::GetInstance()->GetScene()->UninitPlayer(m_nMyPlayerIdx);
	}
}

//==========================================================================
// 終了処理
//==========================================================================
void CPlayer::Kill(void)
{

	my_particle::Create(GetPosition(), my_particle::TYPE_ENEMY_FADE);

	// 影を消す
	if (m_pShadow != NULL)
	{
		m_pShadow->Uninit();
		m_pShadow = NULL;
	}
}

//==========================================================================
// 更新処理
//==========================================================================
void CPlayer::Update(void)
{
	if (IsDeath() == true)
	{
		return;
	}

	// キーボード情報取得
	CInputKeyboard *pInputKeyboard = CManager::GetInstance()->GetInputKeyboard();
	if (pInputKeyboard->GetTrigger(DIK_F5) == true)
	{// F5でリセット
		SetPosition(D3DXVECTOR3(0.0f, 0.0f, -1000.0f));
		SetMove(D3DXVECTOR3(0.0f, 0.0f, 0.0f));
	}

	// エディット中は抜ける
	if (CGame::GetElevation()->IsEdit())
	{
		return;
	}

	// エディット中は抜ける
	if (CGame::GetEditType() != CGame::EDITTYPE_OFF)
	{
		return;
	}

	// 過去の位置保存
	SetOldPosition(GetPosition());

	// 操作
	Controll();

	// モーションの設定処理
	MotionSet();

	// モーション更新
	if (m_pMotion != NULL)
	{
		m_pMotion->Update();
	}

	// 攻撃処理
	Atack();

	// 状態更新
	UpdateState();

	// 位置取得
	D3DXVECTOR3 pos = GetPosition();
	D3DXVECTOR3 posCenter = GetCenterPosition();

	// 移動量取得
	D3DXVECTOR3 move = GetMove();

	// 向き取得
	D3DXVECTOR3 rot = GetRotation();

	// カメラの情報取得
	CCamera *pCamera = CManager::GetInstance()->GetCamera();
	pCamera->SetTargetPosition(pos);
	pCamera->SetTargetRotation(rot);

	// 影の位置更新
	if (m_pShadow != NULL)
	{
		m_pShadow->SetPosition(D3DXVECTOR3(pos.x, m_pShadow->GetPosition().y, pos.z));
	}

	// モーションの情報取得
	if (m_pMotion != NULL)
	{
		CMotion::Info aInfo = m_pMotion->GetInfo(MOTION_WALK);

		// 攻撃情報の総数取得
		int nNumAttackInfo = aInfo.nNumAttackInfo;

		int nCntEffect = 0;
		int nNumEffect = GetEffectParentNum();
		for (int i = 0; i < mylib_const::MAX_OBJ; i++)
		{
			CEffect3D *pEffect = GetEffectParent(i);
			if (pEffect == NULL)
			{// NULLだったら
				continue;
			}

			// エフェクトの位置更新
			pEffect->UpdatePosition(GetRotation());
			nCntEffect++;
			if (nNumEffect <= nCntEffect)
			{
				break;
			}
		}

		// 手のマトリックス取得
		aInfo = m_pMotion->GetInfo(MOTION_ATK_L);
		m_pMtxSnowBallL = GetModel()[aInfo.AttackInfo[0]->nCollisionNum]->GetPtrWorldMtx();

		aInfo = m_pMotion->GetInfo(MOTION_ATK_R);
		m_pMtxSnowBallR = GetModel()[aInfo.AttackInfo[0]->nCollisionNum]->GetPtrWorldMtx();
	}

	// 雪玉の追従
	FollowSnowBall();

#if 0
	// デバッグ表示
	CManager::GetInstance()->GetDebugProc()->Print(
		"------------------[プレイヤーの操作]------------------\n"
		"位置：【X：%f, Y：%f, Z：%f】【X：%f, Y：%f, Z：%f】 【W / A / S / D】\n"
		"向き：【X：%f, Y：%f, Z：%f】 【Z / C】\n"
		"移動量：【X：%f, Y：%f, Z：%f】\n"
		"体力：【%d】\n", pos.x, pos.y, pos.z, posCenter.x, posCenter.y, posCenter.z, rot.x, rot.y, rot.y, move.x, move.y, move.z, GetLife());
#endif

}

//==========================================================================
// 操作処理
//==========================================================================
void CPlayer::Controll(void)
{

	// キーボード情報取得
	CInputKeyboard *pInputKeyboard = CManager::GetInstance()->GetInputKeyboard();

	// ゲームパッド情報取得
	CInputGamepad *pInputGamepad = CManager::GetInstance()->GetInputGamepad();

	// カメラの情報取得
	CCamera *pCamera = CManager::GetInstance()->GetCamera();

	// カメラの向き取得
	D3DXVECTOR3 Camerarot = pCamera->GetRotation();

	// 位置取得
	D3DXVECTOR3 pos = GetPosition();
	D3DXVECTOR3 newPosition = GetPosition();
	D3DXVECTOR3 sakiPos = GetPosition();

	// 移動量取得
	D3DXVECTOR3 move = GetMove();

	// 向き取得
	D3DXVECTOR3 rot = GetRotation();

	// 目標の向き取得
	float fRotDest = GetRotDest();

	// 現在の種類取得
	int nMotionType = m_pMotion->GetType();

	// 移動量取得
	float fMove = GetVelocity();

	// 経過時間取得
	float fCurrentTime = CManager::GetInstance()->GetDeltaTime();


	std::list<CSantaBag*> BagList = CSantaBag::GetList();

	// 要素分繰り返し
	for (const auto& candidate : BagList)
	{
		// 当たり判定
		if (CircleRange2D(pos, candidate->GetPosition(), GetRadius(), 80.0f))
		{
			candidate->Hit();
		}
	}
	

	if (CGame::GetGameManager()->IsControll())
	{// 行動できるとき

		if (m_pMotion->IsGetMove(nMotionType) == 1 &&
			m_state != STATE_DEAD &&
			m_state != STATE_FADEOUT)
		{// 移動可能モーションの時

			if (pInputKeyboard->GetPress(DIK_A) == true || pInputGamepad->GetStickMoveL(m_nMyPlayerIdx).x < 0)
			{//←キーが押された,左移動

				// 移動中にする
				m_sMotionFrag.bMove = true;

				if (pInputKeyboard->GetPress(DIK_W) == true || pInputGamepad->GetStickMoveL(m_nMyPlayerIdx).y > 0)
				{//A+W,左上移動

					move.x += sinf(-D3DX_PI * 0.25f + Camerarot.y) * fMove;
					move.z += cosf(-D3DX_PI * 0.25f + Camerarot.y) * fMove;
					fRotDest = D3DX_PI * 0.75f + Camerarot.y;
				}
				else if (pInputKeyboard->GetPress(DIK_S) == true || pInputGamepad->GetStickMoveL(m_nMyPlayerIdx).y < 0)
				{//A+S,左下移動

					move.x += sinf(-D3DX_PI * 0.75f + Camerarot.y) * fMove;
					move.z += cosf(-D3DX_PI * 0.75f + Camerarot.y) * fMove;
					fRotDest = D3DX_PI * 0.25f + Camerarot.y;
				}
				else
				{//A,左移動

					move.x += sinf(-D3DX_PI * 0.5f + Camerarot.y) * fMove;
					move.z += cosf(-D3DX_PI * 0.5f + Camerarot.y) * fMove;
					fRotDest = D3DX_PI * 0.5f + Camerarot.y;
				}
			}
			else if (pInputKeyboard->GetPress(DIK_D) == true || pInputGamepad->GetStickMoveL(m_nMyPlayerIdx).x > 0)
			{//Dキーが押された,右移動

				// 移動中にする
				m_sMotionFrag.bMove = true;

				if (pInputKeyboard->GetPress(DIK_W) == true || pInputGamepad->GetStickMoveL(m_nMyPlayerIdx).y > 0)
				{//D+W,右上移動

					move.x += sinf(D3DX_PI * 0.25f + Camerarot.y) * fMove;
					move.z += cosf(D3DX_PI * 0.25f + Camerarot.y) * fMove;
					fRotDest = -D3DX_PI * 0.75f + Camerarot.y;
				}
				else if (pInputKeyboard->GetPress(DIK_S) == true || pInputGamepad->GetStickMoveL(m_nMyPlayerIdx).y < 0)
				{//D+S,右下移動

					move.x += sinf(D3DX_PI * 0.75f + Camerarot.y) * fMove;
					move.z += cosf(D3DX_PI * 0.75f + Camerarot.y) * fMove;
					fRotDest = -D3DX_PI * 0.25f + Camerarot.y;
				}
				else
				{//D,右移動

					move.x += sinf(D3DX_PI * 0.5f + Camerarot.y) * fMove;
					move.z += cosf(D3DX_PI * 0.5f + Camerarot.y) * fMove;
					fRotDest = -D3DX_PI * 0.5f + Camerarot.y;
				}
			}
			else if (pInputKeyboard->GetPress(DIK_W) == true || pInputGamepad->GetStickMoveL(m_nMyPlayerIdx).y > 0)
			{//Wが押された、上移動

				// 移動中にする
				m_sMotionFrag.bMove = true;
				move.x += sinf(D3DX_PI * 0.0f + Camerarot.y) * fMove;
				move.z += cosf(D3DX_PI * 0.0f + Camerarot.y) * fMove;
				fRotDest = D3DX_PI * 1.0f + Camerarot.y;
			}
			else if (pInputKeyboard->GetPress(DIK_S) == true || pInputGamepad->GetStickMoveL(m_nMyPlayerIdx).y < 0)
			{//Sが押された、下移動

				// 移動中にする
				m_sMotionFrag.bMove = true;
				move.x += sinf(D3DX_PI * 1.0f + Camerarot.y) * fMove;
				move.z += cosf(D3DX_PI * 1.0f + Camerarot.y) * fMove;
				fRotDest = D3DX_PI * 0.0f + Camerarot.y;
			}
			else
			{
				// 移動中かどうか
				m_sMotionFrag.bMove = false;
			}

		}
		else if (m_pMotion->IsGetMove(nMotionType) == 0 &&
			m_state != STATE_DEAD &&
			m_state != STATE_FADEOUT)
		{
			if (pInputKeyboard->GetPress(DIK_A) == true || pInputGamepad->GetStickMoveL(m_nMyPlayerIdx).x < 0)
			{//←キーが押された,左移動

				if (pInputKeyboard->GetPress(DIK_W) == true || pInputGamepad->GetStickMoveL(m_nMyPlayerIdx).y > 0)
				{//A+W,左上移動
					fRotDest = D3DX_PI * 0.75f + Camerarot.y;
				}
				else if (pInputKeyboard->GetPress(DIK_S) == true || pInputGamepad->GetStickMoveL(m_nMyPlayerIdx).y < 0)
				{//A+S,左下移動
					fRotDest = D3DX_PI * 0.25f + Camerarot.y;
				}
				else
				{//A,左移動
					fRotDest = D3DX_PI * 0.5f + Camerarot.y;
				}
			}
			else if (pInputKeyboard->GetPress(DIK_D) == true || pInputGamepad->GetStickMoveL(m_nMyPlayerIdx).x > 0)
			{//Dキーが押された,右移動

				if (pInputKeyboard->GetPress(DIK_W) == true || pInputGamepad->GetStickMoveL(m_nMyPlayerIdx).y > 0)
				{//D+W,右上移動
					fRotDest = -D3DX_PI * 0.75f + Camerarot.y;
				}
				else if (pInputKeyboard->GetPress(DIK_S) == true || pInputGamepad->GetStickMoveL(m_nMyPlayerIdx).y < 0)
				{//D+S,右下移動
					fRotDest = -D3DX_PI * 0.25f + Camerarot.y;
				}
				else
				{//D,右移動
					fRotDest = -D3DX_PI * 0.5f + Camerarot.y;
				}
			}
			else if (pInputKeyboard->GetPress(DIK_W) == true || pInputGamepad->GetStickMoveL(m_nMyPlayerIdx).y > 0)
			{//Wが押された、上移動
				fRotDest = D3DX_PI * 1.0f + Camerarot.y;
			}
			else if (pInputKeyboard->GetPress(DIK_S) == true || pInputGamepad->GetStickMoveL(m_nMyPlayerIdx).y < 0)
			{//Sが押された、下移動
				fRotDest = D3DX_PI * 0.0f + Camerarot.y;
			}
		}
	}

	// 移動量加算
	newPosition.x += move.x;
	newPosition.z += move.z;

	sakiPos.x = newPosition.x + sinf(D3DX_PI + rot.y) * GetRadius();
	sakiPos.z = newPosition.z + cosf(D3DX_PI + rot.y) * GetRadius();

	// 角度の正規化
	RotNormalize(fRotDest);

	// 現在と目標の差分を求める
	float fRotDiff = fRotDest - rot.y;

	// 角度の正規化
	RotNormalize(fRotDiff);

	// 角度の補正をする
	rot.y += fRotDiff * 0.15f;

	// 角度の正規化
	RotNormalize(rot.y);

	// 重力処理
	if (m_state != STATE_KNOCKBACK && m_state != STATE_DMG && m_state != STATE_DEAD && m_state != STATE_FADEOUT)
	{
		move.y -= mylib_const::GRAVITY;

		// 位置更新
		newPosition.y += move.y;
		sakiPos.y = newPosition.y;
	}

	//**********************************
	// 当たり判定
	//**********************************
	bool bLandStage = Collision(sakiPos, move);

	bool bMove = false;
	if (m_bLandOld == false && bLandStage == true)
	{// 前回は着地していなくて、今回は着地している場合

		bMove = false;
	}

	if (m_bLandOld == true && bLandStage == true)
	{// 前回も今回も着地している場合
		bMove = true;
	}

	if (m_bHitWall == false && 
		(bLandStage == false || bMove == true || m_bLandField == true || m_bJump == true || m_sMotionFrag.bKnockBack == true || m_sMotionFrag.bDead == true))
	{
		pos.x = newPosition.x;
		pos.z = newPosition.z;
		pos.y = sakiPos.y;
		Collision(pos, move);

		// 前回は乗ってたことにする
		m_bLandOld = true;
	}
	else
	{
		D3DXVECTOR3 posOld = GetOldPosition();
		pos.x = posOld.x;
		pos.z = posOld.z;
		pos = posOld;
		move.x = 0.0f;
		pos.y -= mylib_const::GRAVITY * 7.0f;

		if (m_bJump == false)
		{
			m_bJump = true;
		}

		Collision(pos, move);
	}

	// 慣性補正
	if (m_state != STATE_KNOCKBACK && m_state != STATE_DMG && m_state != STATE_DEAD && m_state != STATE_FADEOUT)
	{
		move.x += (0.0f - move.x) * 0.25f;
		move.z += (0.0f - move.z) * 0.25f;
	}

	// 位置設定
	SetPosition(pos);

	// 移動量設定
	SetMove(move);

	// 向き設定
	//SetRotation(rot);

	// 目標の向き設定
	//SetRotDest(fRotDest);

	// エイムの処理
	Aim();

	if (CGame::GetGameManager()->IsControll() &&
		m_state != STATE_DEAD &&
		m_state != STATE_FADEOUT)
	{// 行動できるとき

		if (m_sMotionFrag.bATKL == false && 
			(pInputGamepad->GetTrigger(CInputGamepad::BUTTON_LB, m_nMyPlayerIdx) || pInputKeyboard->GetTrigger(DIK_RETURN)))
		{// 左攻撃
			// 攻撃判定ON
			m_sMotionFrag.bATKL = true;
		}

		if (m_sMotionFrag.bATKR == false &&
			(pInputGamepad->GetTrigger(CInputGamepad::BUTTON_RB, m_nMyPlayerIdx) || pInputKeyboard->GetTrigger(DIK_RETURN)))
		{// 右攻撃
		 // 攻撃判定ON
			m_sMotionFrag.bATKR = true;
		}
	}
}

//==========================================================================
// エイムの処理
//==========================================================================
void CPlayer::Aim(void)
{
	// キーボード情報取得
	CInputKeyboard *pInputKeyboard = CManager::GetInstance()->GetInputKeyboard();

	// ゲームパッド情報取得
	CInputGamepad *pInputGamepad = CManager::GetInstance()->GetInputGamepad();

	// スティックの角度取得
	D3DXVECTOR3 vecStickR = pInputGamepad->GetStickMoveR(m_nMyPlayerIdx);
	D3DXVECTOR3 vecStickL = pInputGamepad->GetStickMoveL(m_nMyPlayerIdx);

	float fLength = D3DXVec3Length(&vecStickR);
	float fLengthL = D3DXVec3Length(&vecStickL);

	if (fLength >= 0.4f)
	{// 右スティックで狙ってる判定
		float fRotDest = atan2f(vecStickR.x, vecStickR.y) + D3DX_PI;

		SetRotDest(fRotDest);

		D3DXVECTOR3 rot = GetRotation();

		// 現在と目標の差分を求める
		float fRotDiff = fRotDest - rot.y;

		// 角度の正規化
		RotNormalize(fRotDiff);

		// 角度の補正をする
		rot.y += fRotDiff * 0.15f;

		// 角度の正規化
		RotNormalize(rot.y);

		// 向き設定
		SetRotation(rot);
	}
	else if (fLengthL >= 0.4f)
	{
		float fRotDest = atan2f(vecStickL.x, vecStickL.y) + D3DX_PI;

		SetRotDest(fRotDest);

		D3DXVECTOR3 rot = GetRotation();

		// 現在と目標の差分を求める
		float fRotDiff = fRotDest - rot.y;

		// 角度の正規化
		RotNormalize(fRotDiff);

		// 角度の補正をする
		rot.y += fRotDiff * 0.15f;

		// 角度の正規化
		RotNormalize(rot.y);

		// 向き設定
		SetRotation(rot);
	}
}

//==========================================================================
// 雪玉の生成
//==========================================================================
void CPlayer::CreateBall(void)
{
	// トランスフォームの設定
	D3DXVECTOR3 pos = GetPosition();

	if (m_pSnowBallR == nullptr)
	{// 右の雪玉生成
		m_pSnowBallR = CMeshSphere::Create(pos, 20.0f, 0);

		if (m_pSnowBallR != nullptr)
		{
			m_pSnowBallR->SetSizeDest(20.0f);
		}
	}

	if (m_pSnowBallL == nullptr)
	{// 左の雪玉生成
		m_pSnowBallL = CMeshSphere::Create(pos, 20.0f, 0);

		if (m_pSnowBallL != nullptr)
		{
			m_pSnowBallL->SetSizeDest(20.0f);
		}
	}
}

//==========================================================================
// 雪玉の追従
//==========================================================================
void CPlayer::FollowSnowBall(void)
{
	if (m_pSnowBallR != nullptr && m_pMtxSnowBallR != nullptr)
	{
		D3DXVECTOR3 pos = GetPosition();
		D3DXVECTOR3 move = GetMove();

		D3DXMATRIX mtxHand;

		universal::SetOffSet(&mtxHand, *m_pMtxSnowBallR, D3DXVECTOR3(40.0f, 0.0f, 20.0f));

		pos = { mtxHand._41,mtxHand._42 ,mtxHand._43 };
		pos += move;

		m_pSnowBallR->SetPosition(pos);
	}
	if (m_pSnowBallL != nullptr && m_pMtxSnowBallL != nullptr)
	{
		D3DXVECTOR3 pos = GetPosition();
		D3DXVECTOR3 move = GetMove();

		D3DXMATRIX mtxHand;

		universal::SetOffSet(&mtxHand, *m_pMtxSnowBallL, D3DXVECTOR3(-40.0f, 0.0f, 20.0f));

		pos = { mtxHand._41,mtxHand._42 ,mtxHand._43 };
		pos += move;

		m_pSnowBallL->SetPosition(pos);
	}
}

//==========================================================================
// モーションの設定
//==========================================================================
void CPlayer::MotionSet(void)
{
	if (m_pMotion == NULL)
	{// モーションがNULLだったら
		return;
	}

	if (m_pMotion->IsFinish() == true)
	{// 終了していたら

		// 現在の種類取得
		int nType = m_pMotion->GetType();
		int nOldType = m_pMotion->GetOldType();

		if (nType == MOTION_ATK_L || nType == MOTION_ATK_R)
		{// 拾うモーション
			m_sMotionFrag.bATKL = false;		// 攻撃判定OFF
			m_sMotionFrag.bATKR = false;		// 攻撃判定OFF

			m_pMotion->Set(MOTION_PICKUP, true);
		}
		else if (m_sMotionFrag.bMove == true && m_sMotionFrag.bKnockBack == false && m_sMotionFrag.bDead == false && m_bJump == false &&
			m_sMotionFrag.bATKL == false && m_sMotionFrag.bATKR == false)
		{// 移動していたら

			m_sMotionFrag.bMove = false;	// 移動判定OFF

			// 移動モーション
			m_pMotion->Set(MOTION_WALK);
		}
		else if (m_sMotionFrag.bATKR == true)
		{// 右攻撃

			m_sMotionFrag.bATKR = false;		// 攻撃判定OFF

			m_pMotion->Set(MOTION_ATK_R, true);
		}
		else if (m_sMotionFrag.bATKL == true)
		{// 左攻撃

			m_sMotionFrag.bATKL = false;		// 攻撃判定OFF

			m_pMotion->Set(MOTION_ATK_L, true);
		}
		else
		{
			// ニュートラルモーション
			m_pMotion->Set(MOTION_DEF);
		}
	}
}

//==========================================================================
// 攻撃
//==========================================================================
void CPlayer::Atack(void)
{
	if (m_pMotion == NULL)
	{// モーションがNULLだったら
		return;
	}

	// 位置取得
	D3DXVECTOR3 pos = GetPosition();

	// 向き取得
	D3DXVECTOR3 rot = GetRotation();

	// カメラの情報取得
	CCamera *pCamera = CManager::GetInstance()->GetCamera();

	// カメラの向き取得
	D3DXVECTOR3 Camerarot = pCamera->GetRotation();

	// モーションの情報取得
	CMotion::Info aInfo = m_pMotion->GetInfo(m_pMotion->GetType());

	// 攻撃情報の総数取得
	int nNumAttackInfo = aInfo.nNumAttackInfo;

	for (int nCntAttack = 0; nCntAttack < nNumAttackInfo; nCntAttack++)
	{
		if (aInfo.AttackInfo[nCntAttack] == NULL)
		{// NULLだったら
			continue;
		}

		int nType = m_pMotion->GetType();


		if (m_pMotion->IsImpactFrame(*aInfo.AttackInfo[nCntAttack]))
		{// 衝撃のカウントと同じとき]
			switch (nType)
			{
			case MOTION_ATK_L:
			case MOTION_ATK_R:	// 雪玉を投げる
			{
				// トランスフォームの取得
				D3DXVECTOR3 pos = m_pMotion->GetAttackPosition(GetModel(), *aInfo.AttackInfo[nCntAttack]);
				D3DXVECTOR3 rot = GetRotation();
				D3DXVECTOR3 move =
				{
					sinf(rot.y) * 15.0f,
					0.0f,
					cosf(rot.y) * 15.0f,
				};

				// 雪玉を投げる
				CBullet::Create(CBullet::TYPE::TYPE_PLAYER, CBullet::MOVETYPE::MOVETYPE_NORMAL, pos, rot, -move, 20.0f);

				if (nType == MOTION_ATK_L)
				{// 左手の場合
					if (m_pSnowBallL != nullptr)
					{
						m_pSnowBallL->Uninit();
						m_pSnowBallL = nullptr;
					}
				}
				else
				{// 右手の場合
					if (m_pSnowBallR != nullptr)
					{
						m_pSnowBallR->Uninit();
						m_pSnowBallR = nullptr;
					}
				}
			}
				break;
			case MOTION_PICKUP:	// 雪玉を拾う
				CreateBall();

				break;
			default:
				break;
			}

		}

		// モーションカウンター取得
		float fAllCount = m_pMotion->GetAllCount();
		if (fAllCount >= aInfo.AttackInfo[nCntAttack]->nMinCnt && fAllCount <= aInfo.AttackInfo[nCntAttack]->nMaxCnt)
		{// 攻撃判定中
			
			// 武器の位置
			D3DXVECTOR3 weponpos = m_pMotion->GetAttackPosition(GetModel(), *aInfo.AttackInfo[nCntAttack]);

			CEffect3D *pEffect = NULL;

			//switch (m_pMotion->GetType())
			//{
			//case MOTION_ATK:
			//case MOTION_ATK2:
			//	
			//	break;
			//}

#if _DEBUG
			CEffect3D::Create(weponpos, D3DXVECTOR3(0.0f, 0.0f, 0.0f), D3DXCOLOR(1.0f, 0.0f, 0.0f, 1.0f), aInfo.AttackInfo[nCntAttack]->fRangeSize, 10, CEffect3D::MOVEEFFECT_NONE, CEffect3D::TYPE_NORMAL);
#endif
			// 敵取得
			CEnemy **ppEnemy = CGame::GetEnemyManager()->GetEnemy();

			// 総数取得
			int nNumAll = CGame::GetEnemyManager()->GetNumAll();
			int i = -1, nCntEnemy = 0;

			while (1)
			{
				if (nCntEnemy >= nNumAll)
				{// 総数超えたら終わり
					break;
				}

				// インデックス加算
				i++;
				if (ppEnemy[i] == NULL)
				{
					continue;
				}

				// 敵の位置取得
				D3DXVECTOR3 TargetPos = ppEnemy[i]->GetPosition();

				// 判定サイズ取得
				float fTargetRadius = ppEnemy[i]->GetRadius();

				if (SphereRange(weponpos, TargetPos, aInfo.AttackInfo[nCntAttack]->fRangeSize, fTargetRadius))
				{// 球の判定

					int nDamage = (int)((float)aInfo.AttackInfo[nCntAttack]->nDamage);
					if (ppEnemy[i]->Hit(nDamage) == true)
					{// 当たってたら

					}
				}

				// 敵の数加算
				nCntEnemy++;
			}
		}
	}

	CManager::GetInstance()->GetDebugProc()->Print(
		"モーションカウンター：%d\n", m_pMotion->GetAllCount());
}

//==========================================================================
// 当たり判定
//==========================================================================
bool CPlayer::Collision(D3DXVECTOR3 &pos, D3DXVECTOR3 &move)
{
	// 向き取得
	D3DXVECTOR3 rot = GetRotation();

	// 着地したかどうか
	bool bLand = false;
	float fHeight = 0.0f;
	m_bLandField = false;
	m_bHitWall = false;			// 壁の当たり判定

	// 高さ取得
	if (m_state != STATE_KNOCKBACK && m_state != STATE_DMG && m_state != STATE_DEAD && m_state != STATE_FADEOUT)
	{
		fHeight = CManager::GetInstance()->GetScene()->GetElevation()->GetHeight(pos, bLand);
	}
	else
	{
		fHeight = pos.y;
	}

	if (fHeight > pos.y)
	{// 地面の方が自分より高かったら

	 // 地面の高さに補正
		pos.y = fHeight;
		m_bLandField = true;

		if (bLand == true)
		{// 着地してたら

		 // ジャンプ使用可能にする
			m_bJump = false;
			move.y = 0.0f;
			m_bLandOld = true;
		}
	}


	// Xファイルとの判定
	CStage *pStage = CGame::GetStage();
	if (pStage == NULL)
	{// NULLだったら
		return false;
	}

	bool bNowLand = false;

	// ステージに当たった判定
	m_bHitStage = false;
	for (int nCntStage = 0; nCntStage < pStage->GetNumAll(); nCntStage++)
	{
		// オブジェクト取得
		CObjectX *pObjX = pStage->GetObj(nCntStage);

		if (pObjX == NULL)
		{// NULLだったら
			continue;
		}

		// 高さ取得
		bool bLand = false;
		fHeight = pObjX->GetHeight(pos, bLand);

		if (bLand == true && fHeight > pos.y)
		{// 地面の方が自分より高かったら

		 // 地面の高さに補正
			if (pos.y + 50.0f <= fHeight)
			{// 自分より壁が高すぎる
				m_bHitWall = true;
			}
			else
			{
				pos.y = fHeight;
			}

			m_bHitStage = true;
			m_bLandField = false;

			if (bLand == true)
			{// 着地してたら

				if ((m_sMotionFrag.bKnockBack || m_bJump == true) && GetPosition().y >= fHeight)
				{
					m_bLandOld = true;
				}

				if (m_bJump == true)
				{// ジャンプ中だったら
					m_pMotion->ToggleFinish(true);
				}

				// ジャンプ使用可能にする
				m_bJump = false;
				move.y = 0.0f;
				bNowLand = true;
				m_sMotionFrag.bJump = false;
			}
		}
	}


	// エリア制限情報取得
	CLimitAreaManager *pLimitManager = CGame::GetLimitEreaManager();
	CLimitArea **ppLimit = pLimitManager->GetLimitErea();

	// 総数取得
	int nNumAll = pLimitManager->GetNumAll();
	int i = -1, nCntErea = 0;

	while (1)
	{
		if (nCntErea >= nNumAll)
		{// 総数超えたら終わり
			break;
		}

		// インデックス加算
		i++;
		if (ppLimit[i] == NULL)
		{
			continue;
		}
		CLimitArea::sLimitEreaInfo info = ppLimit[i]->GetLimitEreaInfo();

		// 大人の壁を適用
		if (pos.x + GetRadius() >= info.fMaxX) { pos.x = info.fMaxX - GetRadius(); }
		if (pos.x - GetRadius() <= info.fMinX) { pos.x = info.fMinX + GetRadius(); }
		if (pos.z + GetRadius() >= info.fMaxZ) { pos.z = info.fMaxZ - GetRadius(); }
		if (pos.z - GetRadius() <= info.fMinZ) { pos.z = info.fMinZ + GetRadius(); }

		// エリアの数加算
		nCntErea++;
	}

	// 向き設定
	SetRotation(rot);

	return bNowLand;
}

//==========================================================================
// ヒット処理
//==========================================================================
bool CPlayer::Hit(const int nValue)
{
	// 体力取得
	int nLife = GetLife();

	if (m_state != STATE_DMG &&
		m_state != STATE_KNOCKBACK &&
		m_state != STATE_INVINCIBLE &&
		m_state != STATE_DEAD &&
		m_state != STATE_FADEOUT)
	{// ダメージ受付状態の時

		// 体力減らす
		nLife -= nValue;


		// ゲームパッド情報取得
		CInputGamepad *pInputGamepad = CManager::GetInstance()->GetInputGamepad();
		pInputGamepad->SetVibration(CInputGamepad::VIBRATION_STATE_DMG, 0);

		m_KnokBackMove.y += 18.0f;
		m_bHitStage = false;

		// 体力設定
		SetLife(nLife);

		if (nLife <= 0)
		{// 体力がなくなったら

			// 死状態
			m_state = STATE_DEAD;

			m_KnokBackMove.y = 8.0f;

			// 遷移カウンター設定
			m_nCntState = DEADTIME;

			// 体力設定
			SetLife(0);

			// ノックバック判定にする
			m_sMotionFrag.bKnockBack = true;

			// やられモーション
			//m_pMotion->Set(MOTION_KNOCKBACK);

			// ノックバックの位置更新
			D3DXVECTOR3 pos = GetPosition();
			D3DXVECTOR3 rot = GetRotation();
			m_posKnokBack = pos;

			// 衝撃波生成
			CImpactWave::Create
			(
				D3DXVECTOR3(pos.x, pos.y + 80.0f, pos.z),	// 位置
				D3DXVECTOR3(D3DX_PI * 0.5f, D3DX_PI + rot.y, D3DX_PI),				// 向き
				D3DXCOLOR(1.0f, 1.0f, 1.0f, 0.3f),			// 色
				80.0f,										// 幅
				80.0f,										// 高さ
				0.0f,										// 中心からの間隔
				20,											// 寿命
				10.0f,										// 幅の移動量
				CImpactWave::TYPE_GIZAWHITE,				// テクスチャタイプ
				false										// 加算合成するか
			);

			CManager::GetInstance()->SetEnableHitStop(18);

			// 振動
			CManager::GetInstance()->GetCamera()->SetShake(21, 30.0f, 0.0f);

			// 死んだ
			return true;
		}

		// 過去の状態保存
		m_Oldstate = m_state;

		// 色設定
		m_mMatcol = D3DXCOLOR(1.0f, 0.0f, 0.0f, 1.0f);

		// ダメージ状態にする
		m_state = STATE_DMG;

		// 遷移カウンター設定
		m_nCntState = 0;

		// ノックバックの位置更新
		D3DXVECTOR3 pos = GetPosition();
		D3DXVECTOR3 rot = GetRotation();
		m_posKnokBack = pos;

		// ノックバック判定にする
		m_sMotionFrag.bKnockBack = true;

		// やられモーション
		///m_pMotion->Set(MOTION_KNOCKBACK);

		// 衝撃波生成
		CImpactWave::Create
		(
			D3DXVECTOR3(pos.x, pos.y + 80.0f, pos.z),	// 位置
			D3DXVECTOR3(D3DX_PI * 0.5f, D3DX_PI + rot.y, D3DX_PI),				// 向き
			D3DXCOLOR(1.0f, 1.0f, 1.0f, 0.3f),			// 色
			80.0f,										// 幅
			80.0f,										// 高さ
			0.0f,										// 中心からの間隔
			20,											// 寿命
			10.0f,										// 幅の移動量
			CImpactWave::TYPE_GIZAWHITE,				// テクスチャタイプ
			false										// 加算合成するか
		);

		CManager::GetInstance()->SetEnableHitStop(12);

		// 振動
		CManager::GetInstance()->GetCamera()->SetShake(12, 25.0f, 0.0f);

		// サウンド再生
		CManager::GetInstance()->GetSound()->PlaySound(CSound::LABEL_SE_PLAYERDMG);
	}

	// 死んでない
	return false;
}

//==========================================================================
// モーションファイル
//==========================================================================
void CPlayer::ChangeMotion(const char* pMotionFile)
{
	if (m_pMotion != NULL)
	{
		m_pMotion->Uninit();
		delete m_pMotion;
		m_pMotion = NULL;
	}

	// モーションの生成処理
	m_pMotion = CMotion::Create(pMotionFile);

	// オブジェクトキャラクターの情報取得
	CObjectChara *pObjChar = GetObjectChara();

	// モーションの設定
	m_pMotion->SetModel(pObjChar->GetModel(), pObjChar->GetNumModel(), CObjectChara::GetObjectChara());

	// ポーズのリセット
	m_pMotion->ResetPose(MOTION_DEF);
}

//==========================================================================
// 状態更新処理
//==========================================================================
void CPlayer::UpdateState(void)
{
	switch (m_state)
	{
	case STATE_NONE:
		// 色設定
		m_mMatcol = D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f);
		break;

	case STATE_INVINCIBLE:
		Invincible();
		break;

	case STATE_DMG:
		Damage();
		break;

	case STATE_DEAD:
		Dead();
		break;

	case STATE_FADEOUT:
		FadeOut();
		break;

	case STATE_KNOCKBACK:
		KnockBack();
		break;
	}
}

//==========================================================================
// 無敵
//==========================================================================
void CPlayer::Invincible(void)
{
	// 状態遷移カウンター減算
	m_nCntState--;

	if (m_nCntState % INVINCIBLE_INT == 0)
	{// 規定間隔
		
		// 色設定
		if (m_mMatcol.a == 1.0f)
		{
			m_mMatcol.a = 0.4f;
		}
		else
		{
			m_mMatcol.a = 1.0f;
		}
	}

	if (m_nCntState <= 0)
	{// 遷移カウンターが0になったら

		// なにもない状態にする
		m_state = STATE_NONE;
		m_nCntState = 0;

		// 色設定
		m_mMatcol = D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f);
	}

}

//==========================================================================
// ダメージ
//==========================================================================
void CPlayer::Damage(void)
{
	// 位置取得
	D3DXVECTOR3 pos = GetPosition();

	// 移動量取得
	D3DXVECTOR3 move = GetMove();

	// 向き取得
	D3DXVECTOR3 rot = GetRotation();

	// 状態遷移カウンター減算
	m_nCntState++;

	// 色設定
	m_mMatcol = D3DXCOLOR(1.0f, 0.0f, 0.0f, 1.0f);

	// 位置更新
	pos.y = (-0.4f * (float)(m_nCntState * m_nCntState) + m_KnokBackMove.y * (float)m_nCntState) + m_posKnokBack.y;
	pos.x += move.x;
	pos.z += move.z;

	// 起伏との判定
	if ((CManager::GetInstance()->GetScene()->GetElevation()->IsHit(pos) || m_bHitStage) && m_nCntState >= 10)
	{// 地面と当たっていたら
		m_state = STATE_INVINCIBLE;
		m_nCntState = INVINCIBLE_TIME;
		m_KnokBackMove.y = 0.0f;	// 移動量ゼロ
		m_bLandOld = true;

		// 色設定
		m_mMatcol = D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f);

		// ノックバック判定消す
		m_sMotionFrag.bKnockBack = false;
		m_pMotion->ToggleFinish(true);


		// Xファイルとの判定
		CStage *pStage = CGame::GetStage();
		if (pStage == NULL)
		{// NULLだったら
			return;
		}

		// ステージに当たった判定
		for (int nCntStage = 0; nCntStage < pStage->GetNumAll(); nCntStage++)
		{
			// オブジェクト取得
			CObjectX *pObjX = pStage->GetObj(nCntStage);

			if (pObjX == NULL)
			{// NULLだったら
				continue;
			}

			// 高さ取得
			bool bLand = false;
			pos.y = pObjX->GetHeight(pos, bLand);
		}


	}
	else if (m_nCntState >= 30)
	{// 遷移カウンターが30になったら

		// ノックバック状態にする
		m_state = STATE_KNOCKBACK;
	}


	// 位置設定
	SetPosition(pos);

	// 移動量設定
	SetMove(move);

	// 向き設定
	SetRotation(rot);
}

//==========================================================================
// 死亡
//==========================================================================
void CPlayer::Dead(void)
{
	// 位置取得
	D3DXVECTOR3 pos = GetPosition();

	// 移動量取得
	D3DXVECTOR3 move = GetMove();

	// 位置更新
	if (m_nCntState > 0)
	{
		int nCnt = DEADTIME - m_nCntState;
		pos.y = (-0.1f * (float)(nCnt * nCnt) + m_KnokBackMove.y * (float)nCnt) + m_posKnokBack.y;
		pos.x += move.x;
	}

	// 状態遷移カウンター減算
	m_nCntState--;

	// 起伏との判定
	if ((CManager::GetInstance()->GetScene()->GetElevation()->IsHit(pos) || m_bHitStage) && m_nCntState >= 10)
	{// 地面と当たっていたら

		m_state = STATE_FADEOUT;	// フェードアウト
		m_nCntState = FADEOUTTIME;
		m_KnokBackMove.y = 0.0f;	// 移動量ゼロ
		m_bLandOld = true;
		move.x = 0.0f;

		// 色設定
		m_mMatcol = D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f);

		// ノックバック判定消す
		m_sMotionFrag.bKnockBack = false;
		m_sMotionFrag.bDead = true;
		//m_pMotion->ToggleFinish(true);

		// ぶっ倒れモーション
		//m_pMotion->Set(MOTION_DEAD);

		// Xファイルとの判定
		CStage *pStage = CGame::GetStage();
		if (pStage == NULL)
		{// NULLだったら
			return;
		}

		// ステージに当たった判定
		for (int nCntStage = 0; nCntStage < pStage->GetNumAll(); nCntStage++)
		{
			// オブジェクト取得
			CObjectX *pObjX = pStage->GetObj(nCntStage);

			if (pObjX == NULL)
			{// NULLだったら
				continue;
			}

			// 高さ取得
			bool bLand = false;
			pos.y = pObjX->GetHeight(pos, bLand);
		}
	}

	// 位置設定
	SetPosition(pos);

	// 移動量設定
	SetMove(move);
}

//==========================================================================
// フェードアウト
//==========================================================================
void CPlayer::FadeOut(void)
{

	// 状態遷移カウンター減算
	m_nCntState--;

	// 色設定
	m_mMatcol.a = (float)m_nCntState / (float)FADEOUTTIME;

	if (m_nCntState <= 0)
	{// 遷移カウンターが0になったら

		// 死亡処理
		Kill();

		// 終了処理
		Uninit();
		return;
	}
}

//==========================================================================
// ノックバック
//==========================================================================
void CPlayer::KnockBack(void)
{
	// 位置取得
	D3DXVECTOR3 pos = GetPosition();

	// 移動量取得
	D3DXVECTOR3 move = GetMove();

	// 向き取得
	D3DXVECTOR3 rot = GetRotation();

	// 目標の向き取得
	float fRotDest = GetRotDest();

	// 移動量取得
	float fMove = GetVelocity();

	// 現在と目標の差分
	float fRotDiff = 0.0f;

	// 距離の判定
	bool bLen = false;


	// 状態遷移カウンター減算
	m_nCntState++;

	// 位置更新
	pos.y = (-0.4f * (float)(m_nCntState * m_nCntState) + m_KnokBackMove.y * (float)m_nCntState) + m_posKnokBack.y;
	pos.x += move.x;
	pos.z += move.z;

	// 起伏との判定
	if ((CManager::GetInstance()->GetScene()->GetElevation()->IsHit(pos) || m_bHitStage))
	{// 地面と当たっていたら
		m_state = STATE_INVINCIBLE;
		m_nCntState = INVINCIBLE_TIME;
		m_KnokBackMove.y = 0.0f;	// 移動量ゼロ
		m_bLandOld = true;

		// 色設定
		m_mMatcol = D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f);
		
		// ノックバック判定消す
		m_sMotionFrag.bKnockBack = false;
		m_pMotion->ToggleFinish(true);

		// Xファイルとの判定
		CStage *pStage = CGame::GetStage();
		if (pStage == NULL)
		{// NULLだったら
			return;
		}

		// ステージに当たった判定
		for (int nCntStage = 0; nCntStage < pStage->GetNumAll(); nCntStage++)
		{
			// オブジェクト取得
			CObjectX *pObjX = pStage->GetObj(nCntStage);

			if (pObjX == NULL)
			{// NULLだったら
				continue;
			}

			// 高さ取得
			bool bLand = false;
			pos.y = pObjX->GetHeight(pos, bLand);
		}
	}


	// 位置設定
	SetPosition(pos);

	// 移動量設定
	SetMove(move);

	// 向き設定
	SetRotation(rot);

	// 目標の向き設定
	SetRotDest(fRotDest);
}

//==========================================================================
// 描画処理
//==========================================================================
void CPlayer::Draw(void)
{

	// 描画処理
	if (m_state == STATE_DMG)
	{
		CObjectChara::Draw(m_mMatcol);
	}
	else if (m_state == STATE_INVINCIBLE || m_state == STATE_FADEOUT)
	{
		CObjectChara::Draw(m_mMatcol.a);
	}
	else
	{
		CObjectChara::Draw();
	}
}

//==========================================================================
// 状態設定
//==========================================================================
void CPlayer::SetState(STATE state, int nCntState)
{
	m_state = state;
	m_nCntState = nCntState;
}

//==========================================================================
// 状態取得
//==========================================================================
int CPlayer::GetState(void)
{
	return m_state;
}

