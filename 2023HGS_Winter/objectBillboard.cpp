//=============================================================================
// 
//  ビルボード処理 [objectBillboard.cpp]
//  Author : 相馬靜雅
// 
//=============================================================================
#include "objectBillboard.h"
#include "manager.h"
#include "renderer.h"
#include "texture.h"

//==========================================================================
// マクロ定義
//==========================================================================
#define POLYGON_TOP		(4)		// ポリゴンの頂点数

//==========================================================================
// 静的メンバ変数宣言
//==========================================================================

//==========================================================================
// コンストラクタ
//==========================================================================
CObjectBillboard::CObjectBillboard(int nPriority) : CObject(nPriority)
{
	D3DXMatrixIdentity(&m_mtxWorld);			// ワールドマトリックス
	m_col = D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f);	// 色
	m_fSize = D3DXVECTOR2(0.0f, 0.0f);			// サイズ
	m_sizeOrigin = D3DXVECTOR2(0.0f, 0.0f);		// 元のサイズ
	m_fLength = 0.0f;							// 対角線の長さ
	m_fAngle = 0.0f;							// 対角線の向き
	m_nTexIdx = 0;	// テクスチャのインデックス番号
	m_pVtxBuff = NULL;		// 頂点バッファ

	for (int nCntVtx = 0; nCntVtx < 32; nCntVtx++)
	{
		m_fTex[nCntVtx] = D3DXVECTOR2(0.0f, 0.0f);			// テクスチャ座標
	}

}

//==========================================================================
// デストラクタ
//==========================================================================
CObjectBillboard::~CObjectBillboard()
{

}

//==========================================================================
// テクスチャの割り当て
//==========================================================================
void CObjectBillboard::BindTexture(int nIdx)
{
	// 割り当てる
	m_nTexIdx = nIdx;
}


//==========================================================================
// 生成処理
//==========================================================================
CObjectBillboard *CObjectBillboard::Create(void)
{
	// 生成用のオブジェクト
	CObjectBillboard *pObjBillBoard = NULL;

	if (pObjBillBoard == NULL)
	{// NULLだったら

		// メモリの確保
		pObjBillBoard = DEBUG_NEW CObjectBillboard;

		if (pObjBillBoard != NULL)
		{// メモリの確保が出来ていたら

			// 初期化処理
			pObjBillBoard->Init();
		}

		return pObjBillBoard;
	}

	return NULL;
}

//==========================================================================
// 生成処理
//==========================================================================
CObjectBillboard *CObjectBillboard::Create(D3DXVECTOR3 pos, D3DXVECTOR3 rot)
{
	// 生成用のオブジェクト
	CObjectBillboard *pObjBillBoard = NULL;

	if (pObjBillBoard == NULL)
	{// NULLだったら

		// メモリの確保
		pObjBillBoard = DEBUG_NEW CObjectBillboard;

		if (pObjBillBoard != NULL)
		{// メモリの確保が出来ていたら

			// 初期化処理
			pObjBillBoard->Init();

			// 位置・向き
			pObjBillBoard->SetPosition(pos);
			pObjBillBoard->SetRotation(rot);
		}

		return pObjBillBoard;
	}

	return NULL;
}

//==========================================================================
// 初期化処理
//==========================================================================
HRESULT CObjectBillboard::Init(void)
{
	HRESULT hr;

	// デバイスの取得
	LPDIRECT3DDEVICE9 pDevice = CManager::GetInstance()->GetRenderer()->GetDevice();

	// 頂点バッファの生成
	if (m_pVtxBuff != NULL)
	{// 既に情報が入ってる場合

		return E_FAIL;
	}

	hr = pDevice->CreateVertexBuffer(sizeof(VERTEX_3D) * POLYGON_TOP,
		D3DUSAGE_WRITEONLY,
		FVF_VERTEX_3D,
		D3DPOOL_MANAGED,
		&m_pVtxBuff,
		NULL);

	if (FAILED(hr))
	{// 失敗したとき
		return E_FAIL;
	}

	m_fTex[0] = D3DXVECTOR2(0.0f, 0.0f);	// テクスチャ座標
	m_fTex[1] = D3DXVECTOR2(1.0f, 0.0f);	// テクスチャ座標
	m_fTex[2] = D3DXVECTOR2(0.0f, 1.0f);	// テクスチャ座標
	m_fTex[3] = D3DXVECTOR2(1.0f, 1.0f);	// テクスチャ座標

	// 頂点情報設定
	SetVtx();

	return S_OK;
}

//==========================================================================
// 終了処理
//==========================================================================
void CObjectBillboard::Uninit(void)
{
	// 頂点バッファの破棄
	if (m_pVtxBuff != NULL)
	{
		m_pVtxBuff->Release();
		m_pVtxBuff = NULL;
	}

	// オブジェクトの破棄
	Release();

}

//==========================================================================
// 更新処理
//==========================================================================
void CObjectBillboard::Update(void)
{
	// 頂点情報設定
	SetVtx();
}

//==========================================================================
// 描画処理
//==========================================================================
void CObjectBillboard::Draw(void)
{
	// デバイスの取得
	LPDIRECT3DDEVICE9 pDevice = CManager::GetInstance()->GetRenderer()->GetDevice();

	// 計算用マトリックス宣言
	D3DXMATRIX mtxRot, mtxTrans;

	// 情報取得
	D3DXVECTOR3 pos = GetPosition();

	// ビューマトリックス取得用
	D3DXMATRIX mtxView;

	// ワールドマトリックスの初期化
	D3DXMatrixIdentity(&m_mtxWorld);

	// ビューマトリックスを取得
	pDevice->GetTransform(D3DTS_VIEW, &mtxView);

	// ポリゴンをカメラに対して正面に向ける
	D3DXMatrixInverse(&m_mtxWorld, NULL, &mtxView);	// 逆配列を求める

#if 0

	// X軸に沿ってる
	m_mtxWorld._12 = 0.0f;
	m_mtxWorld._13 = 0.0f;
	m_mtxWorld._14 = 0.0f;

#else

	// 上で消える
	/*m_mtxWorld._21 = 0.0f;
	m_mtxWorld._23 = 0.0f;
	m_mtxWorld._24 = 0.0f;*/

#endif

	// 通常
	m_mtxWorld._41 = 0.0f;
	m_mtxWorld._42 = 0.0f;
	m_mtxWorld._43 = 0.0f;

	// 位置を反映する
	D3DXMatrixTranslation(&mtxTrans, pos.x, pos.y, pos.z);
	D3DXMatrixMultiply(&m_mtxWorld, &m_mtxWorld, &mtxTrans);

	// ワールドマトリックスの設定
	pDevice->SetTransform(D3DTS_WORLD, &m_mtxWorld);

	// 頂点バッファをデータストリームに設定
	pDevice->SetStreamSource(0, m_pVtxBuff, 0, sizeof(VERTEX_3D));

	// 頂点フォーマットの設定
	pDevice->SetFVF(FVF_VERTEX_3D);

	// テクスチャの設定
	pDevice->SetTexture(0, CManager::GetInstance()->GetTexture()->GetAdress(m_nTexIdx));

	// ビルボードの描画
	pDevice->DrawPrimitive(D3DPT_TRIANGLESTRIP, 0, 2);
}

//==========================================================================
// 頂点情報設定処理
//==========================================================================
void CObjectBillboard::SetVtx(void)
{

	// 頂点情報へのポインタ
	VERTEX_3D *pVtx;

	// 頂点バッファをロックし、頂点情報へのポインタを取得
	m_pVtxBuff->Lock(0, 0, (void**)&pVtx, 0);

	D3DXVECTOR2 size = GetSize();
	D3DXCOLOR col = GetColor();
	D3DXVECTOR3 rot = GetRotation();

	// 頂点座標の設定
	pVtx[0].pos.x = sinf(rot.z - m_fAngle) * m_fLength;
	pVtx[0].pos.y = cosf(rot.z - m_fAngle) * m_fLength;
	pVtx[0].pos.z = 0.0f;

	pVtx[1].pos.x = sinf(rot.z + m_fAngle) * m_fLength;
	pVtx[1].pos.y = cosf(rot.z + m_fAngle) * m_fLength;
	pVtx[1].pos.z = 0.0f;

	pVtx[2].pos.x = sinf(rot.z - D3DX_PI + m_fAngle) * m_fLength;
	pVtx[2].pos.y = cosf(rot.z - D3DX_PI + m_fAngle) * m_fLength;
	pVtx[2].pos.z = 0.0f;

	pVtx[3].pos.x = sinf(rot.z + D3DX_PI - m_fAngle) * m_fLength;
	pVtx[3].pos.y = cosf(rot.z + D3DX_PI - m_fAngle) * m_fLength;
	pVtx[3].pos.z = 0.0f;


	// 法線ベクトルの設定
	pVtx[0].nor = D3DXVECTOR3(0.0f, 1.0f, 0.0f);
	pVtx[1].nor = D3DXVECTOR3(0.0f, 1.0f, 0.0f);
	pVtx[2].nor = D3DXVECTOR3(0.0f, 1.0f, 0.0f);
	pVtx[3].nor = D3DXVECTOR3(0.0f, 1.0f, 0.0f);

	// 頂点カラーの設定
	pVtx[0].col = col;
	pVtx[1].col = col;
	pVtx[2].col = col;
	pVtx[3].col = col;

	// テクスチャ座標の設定
	pVtx[0].tex = m_fTex[0];
	pVtx[1].tex = m_fTex[1];
	pVtx[2].tex = m_fTex[2];
	pVtx[3].tex = m_fTex[3];

	// 頂点バッファをアンロックロック
	m_pVtxBuff->Unlock();
}


//==========================================================================
// 向き設定
//==========================================================================
void CObjectBillboard::SetRotation(const D3DXVECTOR3 rot)
{
	// 向き設定
	CObject::SetRotation(rot);
	m_fLength = sqrtf(m_fSize.x * m_fSize.x + m_fSize.y * m_fSize.y);	// 対角線の長さ
	m_fAngle = atan2f(m_fSize.x, m_fSize.y);							// 対角線の向き
}

//==========================================================================
// マトリックス設定
//==========================================================================
void CObjectBillboard::SetWorldMtx(const D3DXMATRIX mtx)
{
	m_mtxWorld = mtx;
}

//==========================================================================
// マトリックス取得
//==========================================================================
D3DXMATRIX CObjectBillboard::GetWorldMtx(void) const
{
	return m_mtxWorld;
}

//==========================================================================
// 色設定
//==========================================================================
void CObjectBillboard::SetColor(const D3DXCOLOR col)
{
	m_col = col;
}

//==========================================================================
// 色取得
//==========================================================================
D3DXCOLOR CObjectBillboard::GetColor(void) const
{
	return m_col;
}

//==========================================================================
// サイズ設定
//==========================================================================
void CObjectBillboard::SetSize(const D3DXVECTOR2 size)
{
	m_fSize = size;
	m_fLength = sqrtf(m_fSize.x * m_fSize.x + m_fSize.y * m_fSize.y);	// 対角線の長さ
	m_fAngle = atan2f(m_fSize.x, m_fSize.y);							// 対角線の向き
}

//==========================================================================
// サイズ取得
//==========================================================================
D3DXVECTOR2 CObjectBillboard::GetSize(void) const
{
	return m_fSize;
}

//==========================================================================
// 元のサイズの設定
//==========================================================================
void CObjectBillboard::SetSizeOrigin(const D3DXVECTOR2 size)
{
	m_sizeOrigin = size;
}

//==========================================================================
// 元のサイズの取得
//==========================================================================
D3DXVECTOR2 CObjectBillboard::GetSizeOrigin(void) const
{
	return m_sizeOrigin;
}

//==========================================================================
// テクスチャ座標設定
//==========================================================================
void CObjectBillboard::SetTex(D3DXVECTOR2 *tex)
{
	memcpy(&m_fTex[0], tex, sizeof(m_fTex));
}

//==========================================================================
// テクスチャ座標取得
//==========================================================================
D3DXVECTOR2 *CObjectBillboard::GetTex(void)
{
	return &m_fTex[0];
}

//==========================================================================
// 頂点バッファの取得
//==========================================================================
LPDIRECT3DVERTEXBUFFER9 CObjectBillboard::GetVtxBuff(void) const
{
	return m_pVtxBuff;
}

//==========================================================================
// ビルボードオブジェクトの取得
//==========================================================================
CObjectBillboard *CObjectBillboard::GetObjectBillBoard(void)
{
	return this;
}
