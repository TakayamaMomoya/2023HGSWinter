//=============================================================================
// 
// 当たり判定オブジェクト処理 [collisionobject.cpp]
// Author : 相馬靜雅
// 
//=============================================================================
#include "collisionobject.h"
#include "renderer.h"
#include "texture.h"
#include "manager.h"
#include "game.h"
#include "enemy.h"
#include "enemymanager.h"
#include "player.h"
#include "calculation.h"

//==========================================================================
// 静的メンバ変数宣言
//==========================================================================
int CCollisionObject::m_nIdxTex = 0;	// テクスチャのインデックス番号

//==========================================================================
// コンストラクタ
//==========================================================================
CCollisionObject::CCollisionObject(int nPriority) : CObjectBillboard(nPriority)
{
	// 値のクリア
	m_fRadius = 0.0f;	// 半径
	m_nDamage = 0;		// ダメージ
	m_nLife = 0;		// 寿命
	m_nMaxLife = 0;		// 最大寿命(固定)
	m_MyTag = TAG_NONE;			// 自分のタグ
}

//==========================================================================
// デストラクタ
//==========================================================================
CCollisionObject::~CCollisionObject()
{
	
}

//==========================================================================
// 生成処理
//==========================================================================
CCollisionObject *CCollisionObject::Create(void)
{
	// 生成用のオブジェクト
	CCollisionObject *pEffect = NULL;

	if (pEffect == NULL)
	{// NULLだったら

		// メモリの確保
		pEffect = DEBUG_NEW CCollisionObject;

		if (pEffect != NULL)
		{// メモリの確保が出来ていたら

			// 初期化処理
			pEffect->Init();
		}

		return pEffect;
	}

	return NULL;
}

//==========================================================================
// 生成処理
//==========================================================================
CCollisionObject *CCollisionObject::Create(const D3DXVECTOR3 pos, const D3DXVECTOR3 move, const float fRadius, const int nLife, const int nDamage, eMyTag tag)
{
	// 生成用のオブジェクト
	CCollisionObject *pEffect = NULL;

	if (pEffect == NULL)
	{// NULLだったら

		// メモリの確保
		pEffect = DEBUG_NEW CCollisionObject;

		if (pEffect != NULL)
		{// メモリの確保が出来ていたら

			pEffect->SetPosition(pos);
			pEffect->SetMove(move);
			pEffect->m_nDamage = nDamage;	// ダメージ
			pEffect->m_MyTag = tag;			// 種類
			pEffect->m_fRadius = fRadius;
			pEffect->SetSize(D3DXVECTOR2(fRadius, fRadius));
			pEffect->m_nLife = nLife;

			// 初期化処理
			HRESULT hr = pEffect->Init();
			if (FAILED(hr))
			{
				return NULL;
			}
		}

		return pEffect;
	}

	return NULL;
}

//==================================================================================
// 初期化処理
//==================================================================================
HRESULT CCollisionObject::Init(void)
{
	HRESULT hr;

	// 各種変数の初期化
	m_nMaxLife = m_nLife;						// 最大寿命(固定)

	// 種類の設定
	SetType(TYPE_EFFECT3D);

#if 0
	if (m_nIdxTex == 0)
	{
		m_nIdxTex = CManager::GetInstance()->GetTexture()->Regist("data\\TEXTURE\\effect\\effect000.jpg");
	}

	// テクスチャの割り当て
	BindTexture(m_nIdxTex);
#endif

	// 初期化処理
	hr = CObjectBillboard::Init();
	if (FAILED(hr))
	{// 失敗したとき
		Uninit();
		return E_FAIL;
	}

	SetColor(D3DXCOLOR(1.0f, 0.0f, 0.0f, 1.0f));

	return S_OK;
}

//==================================================================================
// 終了処理
//==================================================================================
void CCollisionObject::Uninit(void)
{
	// 終了処理
	CObjectBillboard::Uninit();
}

//==================================================================================
// 更新処理
//==================================================================================
void CCollisionObject::Update(void)
{

	// 位置取得
	D3DXVECTOR3 pos = GetPosition();

	// 移動量取得
	D3DXVECTOR3 move = GetMove();

	// 位置更新
	pos += move;

	// 位置設定
	SetPosition(pos);

	// 移動量設定
	SetMove(move);

	// 寿命の更新
	m_nLife--;

	// サイズ設定
	SetSize(D3DXVECTOR2(m_fRadius, m_fRadius));

	if (m_nLife <= 0)
	{// 寿命が尽きたら
		Uninit();
		return;
	}

	switch (m_MyTag)
	{
	case CCollisionObject::TAG_PLAYER:
		CollisionEnemy();
		break;

	case CCollisionObject::TAG_ENEMY:
		CollisionPlayer();
		break;
	}

	// 頂点座標の設定
	SetVtx();

}

//==================================================================================
// 敵との当たり判定
//==================================================================================
void CCollisionObject::CollisionEnemy(void)
{
	// 敵取得
	CEnemyManager *pEnemyManager = CGame::GetEnemyManager();
	if (pEnemyManager == NULL)
	{
		return;
	}

	// 敵取得
	CEnemy **ppEnemy = pEnemyManager->GetEnemy();

	// 総数取得
	int nNumAll = pEnemyManager->GetNumAll();
	int i = -1, nCntEnemy = 0;

	// 位置取得
	D3DXVECTOR3 pos = GetPosition();

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

		if (SphereRange(pos, TargetPos, m_fRadius, fTargetRadius))
		{// 球の判定

			if (ppEnemy[i]->Hit(m_nDamage) == true)
			{// 当たってたら

			}
		}

		// 敵の数加算
		nCntEnemy++;
	}
}

//==================================================================================
// プレイヤーとの当たり判定
//==================================================================================
void CCollisionObject::CollisionPlayer(void)
{

	// 自分の情報取得
	D3DXVECTOR3 pos = GetPosition();

	// プレイヤーの取得
	for (int nCntPlayer = 0; nCntPlayer < mylib_const::MAX_PLAYER; nCntPlayer++)
	{
		CPlayer *pPlayer = CManager::GetInstance()->GetScene()->GetPlayer(nCntPlayer);
		if (pPlayer == NULL)
		{
			continue;
		}

		// プレイヤー情報取得
		D3DXVECTOR3 PlayerPos = pPlayer->GetPosition();
		float PlayerRadius = pPlayer->GetRadius();
		CPlayer::STATE PlayerState = (CPlayer::STATE)pPlayer->GetState();

		// 球の判定
		if (SphereRange(pos, PlayerPos, m_fRadius, PlayerRadius) &&
			PlayerState != CPlayer::STATE_DEAD &&
			PlayerState != CPlayer::STATE_DMG &&
			PlayerState != CPlayer::STATE_KNOCKBACK &&
			PlayerState != CPlayer::STATE_INVINCIBLE)
		{
			// ヒット処理
			if (pPlayer->Hit(m_nDamage) == false)
			{// 死んでなかったら

			}
		}
	}
}

//==================================================================================
// 描画処理
//==================================================================================
void CCollisionObject::Draw(void)
{
	return;
#ifdef _DEBUG
	// デバイスの取得
	LPDIRECT3DDEVICE9 pDevice = CManager::GetInstance()->GetRenderer()->GetDevice();

	// ライティングを無効にする
	pDevice->SetRenderState(D3DRS_LIGHTING, FALSE);

	// Zテストを無効にする
	pDevice->SetRenderState(D3DRS_ZFUNC, D3DCMP_ALWAYS);
	pDevice->SetRenderState(D3DRS_ZWRITEENABLE, FALSE);	//常に描画する

	// アルファテストを有効にする
	pDevice->SetRenderState(D3DRS_ALPHATESTENABLE, TRUE);
	pDevice->SetRenderState(D3DRS_ALPHAFUNC, D3DCMP_GREATER);
	pDevice->SetRenderState(D3DRS_ALPHAREF, 0);

	// αブレンディングを加算合成に設定
	pDevice->SetRenderState(D3DRS_BLENDOP, D3DBLENDOP_ADD);
	pDevice->SetRenderState(D3DRS_SRCBLEND, D3DBLEND_SRCALPHA);
	pDevice->SetRenderState(D3DRS_DESTBLEND, D3DBLEND_ONE);

	// 描画処理
	CObjectBillboard::Draw();

	// αブレンディングを元に戻す
	pDevice->SetRenderState(D3DRS_BLENDOP, D3DBLENDOP_ADD);
	pDevice->SetRenderState(D3DRS_SRCBLEND, D3DBLEND_SRCALPHA);
	pDevice->SetRenderState(D3DRS_DESTBLEND, D3DBLEND_INVSRCALPHA);

	// アルファテストを無効にする
	pDevice->SetRenderState(D3DRS_ALPHATESTENABLE, FALSE);
	pDevice->SetRenderState(D3DRS_ALPHAFUNC, D3DCMP_ALWAYS);
	pDevice->SetRenderState(D3DRS_ALPHAREF, 0);

	// Zテストを有効にする
	pDevice->SetRenderState(D3DRS_ZFUNC, D3DCMP_LESSEQUAL);
	pDevice->SetRenderState(D3DRS_ZWRITEENABLE, TRUE);

	// ライティングを有効にする
	pDevice->SetRenderState(D3DRS_LIGHTING, TRUE);
#endif
}
