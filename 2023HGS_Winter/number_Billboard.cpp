//=============================================================================
// 
//  数字(ビルボード)処理 [number_Billboard.cpp]
//  Author : 相馬靜雅
// 
//=============================================================================
#include "number_Billboard.h"
#include "manager.h"
#include "renderer.h"

//==========================================================================
// マクロ定義
//==========================================================================
#define WIDTH			(640.0f)					// 横幅
#define HEIGHT			(360.0f)					// 縦幅
#define SCROLL_SPEED	(-0.005f)					// スクロール速度

//==========================================================================
// 静的メンバ変数宣言
//==========================================================================

//==========================================================================
// コンストラクタ
//==========================================================================
CNumberBillboard::CNumberBillboard(int nPriority) : CNumber(nPriority)
{
	// 値のクリア
	m_pObjBillboard = NULL;		// オブジェクトビルボードのオブジェクト
}

//==========================================================================
// デストラクタ
//==========================================================================
CNumberBillboard::~CNumberBillboard()
{

}

//==========================================================================
// 初期化処理
//==========================================================================
HRESULT CNumberBillboard::Init(int nPriority)
{
	// 生成処理
	m_pObjBillboard = CObjectBillboard::Create();

	return S_OK;
}

//==========================================================================
// 終了処理
//==========================================================================
void CNumberBillboard::Uninit(void)
{
	// 終了処理
	if (m_pObjBillboard != NULL)
	{// NULLじゃなかったら
		m_pObjBillboard = NULL;
	}
}

//==========================================================================
// 解放処理
//==========================================================================
void CNumberBillboard::Release(void)
{
	if (m_pObjBillboard != NULL)
	{// NULLじゃなかったら
		m_pObjBillboard->Uninit();
		m_pObjBillboard = NULL;
	}
}

//==========================================================================
// 更新処理
//==========================================================================
void CNumberBillboard::Update(void)
{
	// 更新処理
	if (m_pObjBillboard != NULL)
	{
		m_pObjBillboard->Update();
	}
}

//==========================================================================
// 描画処理
//==========================================================================
void CNumberBillboard::Draw(void)
{
	// デバイスの取得
	LPDIRECT3DDEVICE9 pDevice = CManager::GetInstance()->GetRenderer()->GetDevice();

	// ライティングを無効にする
	pDevice->SetRenderState(D3DRS_LIGHTING, FALSE);

	// アルファテストを有効にする
	pDevice->SetRenderState(D3DRS_ALPHATESTENABLE, TRUE);
	pDevice->SetRenderState(D3DRS_ALPHAFUNC, D3DCMP_GREATER);
	pDevice->SetRenderState(D3DRS_ALPHAREF, 0);

	// 描画処理
	if (m_pObjBillboard != NULL)
	{// NULLじゃなかったら
		m_pObjBillboard->Draw();
	}

	// アルファテストを無効にする
	pDevice->SetRenderState(D3DRS_ALPHATESTENABLE, FALSE);
	pDevice->SetRenderState(D3DRS_ALPHAFUNC, D3DCMP_ALWAYS);
	pDevice->SetRenderState(D3DRS_ALPHAREF, 0);

	// ライティングを有効にする
	pDevice->SetRenderState(D3DRS_LIGHTING, TRUE);
}

//==========================================================================
// 頂点情報設定処理
//==========================================================================
void CNumberBillboard::SetVtx(void)
{
	m_pObjBillboard->SetVtx();
}

//==========================================================================
// テクスチャの割り当て
//==========================================================================
void CNumberBillboard::BindTexture(int nIdx)
{
	// 割り当てる
	m_pObjBillboard->BindTexture(nIdx);
}

//==========================================================================
// 種類設定
//==========================================================================
void CNumberBillboard::SetType(const CObject::TYPE type)
{
	m_pObjBillboard->SetType(type);
}


//==========================================================================
// 位置設定
//==========================================================================
void CNumberBillboard::SetPosition(const D3DXVECTOR3 pos)
{
	m_pObjBillboard->SetPosition(pos);
}

//==========================================================================
// 位置取得
//==========================================================================
D3DXVECTOR3 CNumberBillboard::GetPosition(void) const
{
	return m_pObjBillboard->GetPosition();
}

//==========================================================================
// 移動量設定
//==========================================================================
void CNumberBillboard::SetMove(const D3DXVECTOR3 move)
{
	m_pObjBillboard->SetMove(move);
}

//==========================================================================
// 移動量取得
//==========================================================================
D3DXVECTOR3 CNumberBillboard::GetMove(void) const
{
	return m_pObjBillboard->GetMove();
}

//==========================================================================
// 色設定
//==========================================================================
void CNumberBillboard::SetColor(const D3DXCOLOR col)
{
	m_pObjBillboard->SetColor(col);
}

//==========================================================================
// 色取得
//==========================================================================
D3DXCOLOR CNumberBillboard::GetColor(void) const
{
	return m_pObjBillboard->GetColor();
}

//==========================================================================
// サイズ設定
//==========================================================================
void CNumberBillboard::SetSize(const D3DXVECTOR2 size)
{
	m_pObjBillboard->SetSize(size);		// サイズ
}

//==========================================================================
// サイズ取得
//==========================================================================
D3DXVECTOR2 CNumberBillboard::GetSize(void) const
{
	return m_pObjBillboard->GetSize();
}

//==========================================================================
// 元のサイズの設定
//==========================================================================
void CNumberBillboard::SetSizeOrigin(const D3DXVECTOR2 size)
{
	m_pObjBillboard->SetSizeOrigin(size);
}

//==========================================================================
// 元のサイズの取得
//==========================================================================
D3DXVECTOR2 CNumberBillboard::GetSizeOrigin(void) const
{
	return m_pObjBillboard->GetSizeOrigin();
}

//==========================================================================
// テクスチャ座標設定
//==========================================================================
void CNumberBillboard::SetTex(D3DXVECTOR2 *tex)
{
	m_pObjBillboard->SetTex(tex);
}

//==========================================================================
// テクスチャ座標取得
//==========================================================================
D3DXVECTOR2 *CNumberBillboard::GetTex(void)
{
	return m_pObjBillboard->GetTex();
}

//==========================================================================
// オブジェクトビルボードオブジェクトの取得
//==========================================================================
CObjectBillboard *CNumberBillboard::GetObjectBillboard(void)
{
	return m_pObjBillboard;
}