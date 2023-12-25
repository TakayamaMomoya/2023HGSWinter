//=========================================================
//
// トナカイ処理 [enemy_reindeer.cpp]
// Author = 阿部翔大郎
//
//=========================================================

//===============================================
// インクルード
//===============================================
#include "enemy_reindeer.h"
#include "manager.h"
#include "calculation.h"

//==========================================================================
// 定数定義
//==========================================================================
namespace
{
	const float LENGTH_PUNCH = 300.0f;		// パンチの長さ
	const float VELOCITY_WALK = 1.0f;		// 歩き
	const float VELOCITY_DASH = 1.5f;		// 走る
	const float TIME_WAIT = 2.0f;			// 待機
	const float TIME_DASH = 10.0f;			// 走るまでの時間
}

//==========================================================================
// 関数ポインタ
//==========================================================================
CEnemyReindeer::ACT_FUNC CEnemyReindeer::m_ActFuncList[] =
{
	&CEnemyReindeer::ActChase,			// 追い掛け
	&CEnemyReindeer::ActAttackProximity,	// 近接
	&CEnemyReindeer::ActWait,				// 待機
};

//==========================================================================
// コンストラクタ
//==========================================================================
CEnemyReindeer::CEnemyReindeer(int nPriority) : CEnemy(nPriority)
{
	m_Action = ACTION_CHASE;	// 行動
	m_fActTime = 0.0f;			// 行動カウンター
	m_fSpeed = 0.0f;			// 移動速度
	m_fDashTime = 0.0f;			// 走るまでのカウンター
	m_bCatchUp = false;			// 追い着き判定
}

//==========================================================================
// デストラクタ
//==========================================================================
CEnemyReindeer::~CEnemyReindeer()
{

}

//==========================================================================
// 初期化処理
//==========================================================================
HRESULT CEnemyReindeer::Init(void)
{
	//初期化処理
	CEnemy::Init();

	// 行動
	m_Action = ACTION_CHASE;

	// 移動速度
	m_fSpeed = VELOCITY_WALK;

	return S_OK;
}

//==========================================================================
// 終了処理
//==========================================================================
void CEnemyReindeer::Uninit(void)
{
	// 終了処理
	CEnemy::Uninit();
}

//==========================================================================
// 殺す
//==========================================================================
void CEnemyReindeer::Kill(void)
{
	// 死亡処理
	CEnemy::Kill();
}

//==========================================================================
// 更新処理
//==========================================================================
void CEnemyReindeer::Update(void)
{
	// 死亡の判定
	if (IsDeath() == true)
	{// 死亡フラグが立っていたら
		return;
	}

	// 更新処理
	CEnemy::Update();

	m_fDashTime += CManager::GetInstance()->GetDeltaTime();

	if (TIME_DASH <= m_fDashTime)
	{// 一定時間経過後に速度を上げる
		m_fSpeed = VELOCITY_DASH;
	}
}

//==========================================================================
// 行動設定
//==========================================================================
void CEnemyReindeer::ActionSet(void)
{

}

//==========================================================================
// 行動更新
//==========================================================================
void CEnemyReindeer::UpdateAction(void)
{
	// 状態別処理
	(this->*(m_ActFuncList[m_Action]))();
}

//==========================================================================
// 待機
//==========================================================================
void CEnemyReindeer::ActWait(void)
{
	// 待機モーション設定
	m_pMotion->Set(MOTION_DEF);

	// ターゲットの方を向く
	RotationTarget();

	// 行動カウンター加算
	m_fActTime += CManager::GetInstance()->GetDeltaTime();

	if (TIME_WAIT <= m_fActTime)
	{// 待機時間超えたら

		// 近接攻撃
		m_fActTime = 0.0f;

		// 追い着き判定
		m_bCatchUp = CircleRange3D(GetPosition(), m_TargetPosition, LENGTH_PUNCH, 0.0f);
	}
}


//==========================================================================
// 追い掛け
//==========================================================================
void CEnemyReindeer::ActChase(void)
{
	// 移動フラグを立てる
	m_sMotionFrag.bMove = true;

	// ターゲットの方を向く
	RotationTarget();

	// 行動別移動処理
	ChaseNormal();
}

//==========================================================================
// 歩き追い掛け
//==========================================================================
void CEnemyReindeer::ChaseNormal(void)
{
	// 情報取得
	D3DXVECTOR3 move = GetMove();
	D3DXVECTOR3 rot = GetRotation();
	float fMove = GetVelocity();

	// 移動量設定
	move.x = sinf(D3DX_PI + rot.y) * fMove * m_fSpeed;
	move.z = cosf(D3DX_PI + rot.y) * fMove * m_fSpeed;

	// 移動量設定
	SetMove(move);
}

//==========================================================================
// 近接攻撃
//==========================================================================
void CEnemyReindeer::ActAttackProximity(void)
{
	if (m_bCatchUp == false)
	{// 追い着いてない時

		// ターゲットの方を向く
		RotationTarget();

		// 移動フラグを立てる
		m_sMotionFrag.bMove = true;

		// 行動する為の行動別移動処理
		ChaseNormal();

		// 行動別移動処理
		float fLength = 0.0f;
		fLength = LENGTH_PUNCH;

		// 追い着き判定
		m_bCatchUp = CircleRange3D(GetPosition(), m_TargetPosition, fLength, 0.0f);
	}
	else
	{// 攻撃の長さ内

		// 攻撃フラグを立てる
		m_sMotionFrag.bATK = true;

		// 行動別移動処理
		AttackPunch();
	}
}

//==========================================================================
// パンチ攻撃
//==========================================================================
void CEnemyReindeer::AttackPunch(void)
{
	int nType = m_pMotion->GetType();
	if (nType == MOTION_PUNCH && m_pMotion->IsFinish() == true)
	{// パンチ攻撃が終わってたら

		// 待機行動
		m_Action = ACTION_WAIT;

		// 待機モーション設定
		m_pMotion->Set(MOTION_DEF);

		// 追い着いてない判定
		m_bCatchUp = false;
		return;
	}

	if (nType != MOTION_PUNCH)
	{
		// パンチモーション設定
		m_pMotion->Set(MOTION_PUNCH);
	}

	// 攻撃フラグを立てる
	m_sMotionFrag.bATK = true;
}

//==========================================================================
// 描画処理
//==========================================================================
void CEnemyReindeer::Draw(void)
{
	// 描画処理
	CEnemy::Draw();
}

//==========================================================================
// モーションセット
//==========================================================================
void CEnemyReindeer::MotionSet(void)
{
	if (m_pMotion->IsFinish() == true)
	{// 終了していたら

		// 現在の種類取得
		int nType = m_pMotion->GetType();

		if (m_sMotionFrag.bMove == true && m_sMotionFrag.bKnockback == false && m_sMotionFrag.bATK == false)
		{// 移動していたら

			// 攻撃していない
			m_sMotionFrag.bATK = false;

			// 行動別設定処理
			m_pMotion->Set(MOTION_WALK);
		}
		else if (m_sMotionFrag.bKnockback == true)
		{// やられ中だったら

			// やられモーション
			//m_pMotion->Set(MOTION_KNOCKBACK);
		}
		else if (m_sMotionFrag.bATK == true)
		{// 攻撃していたら

			// 攻撃判定OFF
			m_sMotionFrag.bATK = false;

			// 行動別設定処理
			m_pMotion->Set(MOTION_PUNCH);
		}
		//else
		//{
		//	// ニュートラルモーション
		//	m_pMotion->Set(MOTION_DEF);
		//}
	}
}

//==========================================================================
// ターゲットの方を向く
//==========================================================================
void CEnemyReindeer::RotationTarget(void)
{
	// 位置取得
	D3DXVECTOR3 pos = GetPosition();
	D3DXVECTOR3 rot = GetRotation();

	// 目標の角度を求める
	float fRotDest = atan2f((pos.x - m_TargetPosition.x), (pos.z - m_TargetPosition.z));

	// 目標との差分
	float fRotDiff = fRotDest - rot.y;

	//角度の正規化
	RotNormalize(fRotDiff);

	//角度の補正をする
	rot.y += fRotDiff * 0.1f;
	RotNormalize(rot.y);

	// 向き設定
	SetRotation(rot);

	// 目標の向き設定
	SetRotDest(fRotDest);
}

//==========================================================================
// 攻撃時処理
//==========================================================================
void CEnemyReindeer::AttackAction(int nModelNum, CMotion::AttackInfo ATKInfo)
{
	// モーション情報取得
	int nMotionType = m_pMotion->GetType();
	D3DXVECTOR3 weponpos = m_pMotion->GetAttackPosition(GetModel(), ATKInfo);

	// 情報取得
	D3DXVECTOR3 pos = GetPosition();
	D3DXVECTOR3 rot = GetRotation();

	// モーション別処理
	switch (nMotionType)
	{
	case MOTION_PUNCH:
		break;
	}
}

//==========================================================================
// 攻撃判定中処理
//==========================================================================
void CEnemyReindeer::AttackInDicision(CMotion::AttackInfo ATKInfo)
{
	// 基底の攻撃判定中処理
	CEnemy::AttackInDicision(ATKInfo);

	// モーション情報取得
	int nMotionType = m_pMotion->GetType();
	D3DXVECTOR3 weponpos = m_pMotion->GetAttackPosition(GetModel(), ATKInfo);

	// モーション別処理
	switch (nMotionType)
	{
	case MOTION_PUNCH:
		break;
	}
}
