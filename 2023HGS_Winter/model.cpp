//=============================================================================
// 
//  モデル処理 [model.cpp]
//  Author : 相馬靜雅
// 
//=============================================================================
#include "model.h"
#include "manager.h"
#include "renderer.h"
#include "object.h"
#include "calculation.h"
#include "texture.h"
#include "Xload.h"
#include "light.h"

//==========================================================================
// マクロ定義
//==========================================================================

//==========================================================================
// 静的メンバ変数宣言
//==========================================================================
int CModel::m_nNumAll = 0;	// 総数

//==========================================================================
// コンストラクタ
//==========================================================================
CModel::CModel(int nPriority)
{
	D3DXMatrixIdentity(&m_mtxWorld);				// ワールドマトリックス
	m_pos = mylib_const::DEFAULT_VECTOR3;			// 位置
	m_posOld = mylib_const::DEFAULT_VECTOR3;		// 前回の位置
	m_posOrigin = mylib_const::DEFAULT_VECTOR3;		// 元の位置
	m_rot = mylib_const::DEFAULT_VECTOR3;			// 向き
	m_rotOrigin = mylib_const::DEFAULT_VECTOR3;		// 向き
	m_scale = mylib_const::DEFAULT_SCALE;			// スケール
	m_nIdxXFile = 0;								// Xファイルのインデックス番号
	m_nIdxTexture = NULL;							// テクスチャのインデックス番号
	m_pParent = NULL;								// 親モデルのポインタ
	m_nNumAll++;									// 総数加算
}

//==========================================================================
// デストラクタ
//==========================================================================
CModel::~CModel()
{

}

//==========================================================================
// Xファイルのデータ割り当て
//==========================================================================
void CModel::BindXData(int nIdxXFile)
{
	// 情報割り当て
	m_nIdxXFile = nIdxXFile;

	// テクスチャ割り当て
	BindTexture();
}

//==========================================================================
// テクスチャ割り当て
//==========================================================================
void CModel::BindTexture(void)
{
	if (m_nIdxTexture != NULL)
	{
		delete[] m_nIdxTexture;
	}

	// Xファイルのデータ取得
	CXLoad::SXFile *pXData = CScene::GetXLoad()->GetMyObject(m_nIdxXFile);

	// マテリアル分メモリ確保
	m_nIdxTexture = DEBUG_NEW int[(int)pXData->dwNumMat];

	// テクスチャのインデックス番号
	for (int i = 0; i < (int)pXData->dwNumMat; i++)
	{
		m_nIdxTexture[i] = pXData->nIdxTexture[i];
	}
}

//==========================================================================
// 親のマトリックス設定
//==========================================================================
void CModel::SetParent(CModel *pModel)
{
	// 親のポインタを渡す
	m_pParent = pModel;
}

//==========================================================================
// 生成処理
//==========================================================================
CModel *CModel::Create(const char *pFileName, D3DXVECTOR3 pos, D3DXVECTOR3 rot)
{
	// 生成用のオブジェクト
	CModel *pModel = NULL;

	if (pModel == NULL)
	{// NULLだったら

		// メモリの確保
		pModel = DEBUG_NEW CModel;

		if (pModel == NULL)
		{// NULLだったら

			delete pModel;
			pModel = NULL;
			return NULL;
		}

		if (pModel != NULL)
		{// メモリの確保が出来ていたら

			// 初期化処理
			HRESULT hr = pModel->Init(pFileName);

			if (FAILED(hr))
			{// 失敗していたら
				return NULL;
			}

			// 位置・向き
			pModel->SetPosition(pos);
			pModel->m_posOrigin = pos;
			pModel->SetRotation(rot);
			pModel->SetOriginRotation(rot);
		}

		return pModel;
	}

	return NULL;
}

//==========================================================================
// 初期化処理
//==========================================================================
HRESULT CModel::Init(const char *pFileName)
{
	// Xファイルのデータ取得
	CXLoad *pXLoad = CScene::GetXLoad();

	// Xファイルのロード
	m_nIdxXFile = pXLoad->XLoad(pFileName);

	// Xファイルのデータ割り当て
	BindXData(m_nIdxXFile);

	// Xファイルのデータ取得
	CXLoad::SXFile *pXData = CScene::GetXLoad()->GetMyObject(m_nIdxXFile);

	// 全頂点チェック
	CheckVtx(GetRotation().y, &pXData->vtxMax, &pXData->vtxMin, pXData->pMesh, pXData->pVtxBuff);

	// テクスチャ割り当て
	BindTexture();
	return S_OK;
}

//==========================================================================
// 終了処理
//==========================================================================
void CModel::Uninit(void)
{
	//// 親モデルのポインタ
	//if (m_pParent != NULL)
	//{
	//	m_pParent = NULL;
	//}
	if (m_nIdxTexture != NULL)
	{
		delete[] m_nIdxTexture;
	}
}

//==========================================================================
// 更新処理
//==========================================================================
void CModel::Update(void)
{
	// Xファイルのデータ取得
	CXLoad *pXLoad = CScene::GetXLoad();

	// Xファイルのデータ取得
	CXLoad::SXFile *pXData = CScene::GetXLoad()->GetMyObject(m_nIdxXFile);

	// 全頂点チェック
	CheckVtx(GetRotation().y, &pXData->vtxMax, &pXData->vtxMin, pXData->pMesh, pXData->pVtxBuff);
}

//==========================================================================
// ワールドマトリックス計算
//==========================================================================
void CModel::CalWorldMtx(void)
{
	// デバイスの取得
	LPDIRECT3DDEVICE9 pDevice = CManager::GetInstance()->GetRenderer()->GetDevice();

	D3DXMATRIX mtxRot, mtxTrans, mtxScale, mtxRotOrigin;	// 計算用マトリックス宣言
	D3DXMATRIX mtxnParent;			// 親のマトリックス

	bool bScale = false;

	// 親マトリックスの初期化
	D3DXMatrixIdentity(&mtxRotOrigin);
	D3DXMatrixIdentity(&mtxnParent);

	// ワールドマトリックスの初期化
	D3DXMatrixIdentity(&m_mtxWorld);

	// スケールを反映する
	D3DXMatrixScaling(&mtxScale, m_scale.x, m_scale.y, m_scale.z);
	D3DXMatrixMultiply(&m_mtxWorld, &m_mtxWorld, &mtxScale);

	// 元の向きを反映する
	D3DXMatrixRotationYawPitchRoll(&mtxRotOrigin, m_rotOrigin.y, m_rotOrigin.x, m_rotOrigin.z);

	// 向きを反映する
	D3DXMatrixRotationYawPitchRoll(&mtxRot, m_rot.y, m_rot.x, m_rot.z);
	D3DXMatrixMultiply(&m_mtxWorld, &m_mtxWorld, &mtxRot);
	D3DXMatrixMultiply(&m_mtxWorld, &m_mtxWorld, &mtxRotOrigin);

	// 位置を反映する
	D3DXMatrixTranslation(&mtxTrans, m_pos.x, m_pos.y, m_pos.z);
	D3DXMatrixMultiply(&m_mtxWorld, &m_mtxWorld, &mtxTrans);

	// 親のマトリックスと掛け合わせる
	if (m_pParent == NULL)
	{// 自分が親だった場合

		// 最新のマトリックスを渡す(DirectXが覚えているもの)
		pDevice->GetTransform(D3DTS_WORLD, &mtxnParent);
	}
	else
	{// 親がいる場合

		// 親のマトリックスを渡す
		mtxnParent = m_pParent->GetWorldMtx();

		D3DXVECTOR3 scaleVector;

		// マトリックスからスケール情報を抽出
		scaleVector.x = D3DXVec3Length(&D3DXVECTOR3(mtxnParent._11, mtxnParent._12, mtxnParent._13));
		scaleVector.y = D3DXVec3Length(&D3DXVECTOR3(mtxnParent._21, mtxnParent._22, mtxnParent._23));
		scaleVector.z = D3DXVec3Length(&D3DXVECTOR3(mtxnParent._31, mtxnParent._32, mtxnParent._33));
		if (scaleVector != D3DXVECTOR3(1.0f, 1.0f, 1.0f))
		{
			bScale = true;
		}
	}

	// 自分に親のワールドマトリックスを掛ける
	D3DXMatrixMultiply(&m_mtxWorld, &m_mtxWorld, &mtxnParent);

	// ワールドマトリックスの設定
	pDevice->SetTransform(D3DTS_WORLD, &m_mtxWorld);

	if (m_scale != D3DXVECTOR3(1.0f, 1.0f, 1.0f))
	{// 少しでも違う場合

		bScale = true;
	}

	if (bScale)
	{
		// 自動正規化をONにする
		pDevice->SetRenderState(D3DRS_NORMALIZENORMALS, TRUE);
	}

}

//==========================================================================
// シャドウマトリックスの描画
//==========================================================================
void CModel::DrawShadowMtx(void)
{
	// デバイスの取得
	LPDIRECT3DDEVICE9 pDevice = CManager::GetInstance()->GetRenderer()->GetDevice();

	// 減算合成の設定
	pDevice->SetRenderState(D3DRS_BLENDOP, D3DBLENDOP_REVSUBTRACT);
	pDevice->SetRenderState(D3DRS_SRCBLEND, D3DBLEND_SRCALPHA);
	pDevice->SetRenderState(D3DRS_DESTBLEND, D3DBLEND_ONE);

	D3DXMATRIX mtxShadow;
	D3DXVECTOR4 posLight;	// ライトの位置
	D3DXVECTOR3 pos, normal;	// 平面上の任意の点,法線ベクトル
	D3DXPLANE plane;		// 平面情報
	D3DLIGHT9 light;		// ライト情報
	D3DXMATERIAL *pMat;				// マテリアルデータへのポインタ

	
	// Xファイルのデータ取得
	CXLoad::SXFile *pXData = CScene::GetXLoad()->GetMyObject(m_nIdxXFile);

	//ライトの位置を設定
	pDevice->GetLight(0, &light);
	posLight = D3DXVECTOR4(-light.Direction.x, -light.Direction.y, -light.Direction.z, 0.0f);

	//シャドウマトリックスの初期化
	D3DXMatrixIdentity(&mtxShadow);

	// 平面情報を生成
	pos = D3DXVECTOR3(0.0f, 3.0f, 0.0f);
	normal = D3DXVECTOR3(0.0f, 1.0f, 0.0f);
	D3DXPlaneFromPointNormal(&plane, &pos, &normal);

	// シャドウマトリックスの作成
	D3DXMatrixShadow(&mtxShadow, &posLight, &plane);
	D3DXMatrixMultiply(&mtxShadow, &m_mtxWorld, &mtxShadow);

	//シャドウマトリックスの設定
	pDevice->SetTransform(D3DTS_WORLD, &mtxShadow);

	// マテリアルデータへのポインタを取得
	pMat = (D3DXMATERIAL*)pXData->pBuffMat->GetBufferPointer();

	D3DXMATERIAL matNow;	// 今回のマテリアル

	// 他の情報クリア
	ZeroMemory(&matNow, sizeof(D3DXMATERIAL));
	matNow.MatD3D.Diffuse = D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f);
	matNow.MatD3D.Ambient = D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f);

	// 頂点数分繰り返し
	for (int nCntMat = 0; nCntMat < (int)pXData->dwNumMat; nCntMat++)
	{
		//マテリアルの設定
		pDevice->SetMaterial(&matNow.MatD3D);

		//テクスチャの設定
		pDevice->SetTexture(0, NULL);

		// パーツの描画
		pXData->pMesh->DrawSubset(nCntMat);
	}

	// 減算合成をもとに戻す
	pDevice->SetRenderState(D3DRS_BLENDOP, D3DBLENDOP_ADD);
	pDevice->SetRenderState(D3DRS_SRCBLEND, D3DBLEND_SRCALPHA);
	pDevice->SetRenderState(D3DRS_DESTBLEND, D3DBLEND_INVSRCALPHA);
}

//==========================================================================
// 描画処理
//==========================================================================
void CModel::Draw(void)
{
	// デバイスの取得
	LPDIRECT3DDEVICE9 pDevice = CManager::GetInstance()->GetRenderer()->GetDevice();

	D3DXMATRIX mtxRot, mtxTrans;	// 計算用マトリックス宣言
	D3DXMATRIX mtxRotOrigin;		// 計算用マトリックス宣言
	D3DMATERIAL9 matDef;			// 現在のマテリアル保存用
	D3DXMATERIAL *pMat;				// マテリアルデータへのポインタ
	D3DXMATRIX mtxnParent;			// 親の計算用マトリックス

	// ワールドマトリックスの計算処理
	CalWorldMtx();

	// 現在のマテリアルを取得
	pDevice->GetMaterial(&matDef);

	// Xファイルのデータ取得
	CXLoad::SXFile *pXData = CScene::GetXLoad()->GetMyObject(m_nIdxXFile);

	// マテリアルデータへのポインタを取得
	pMat = (D3DXMATERIAL*)pXData->pBuffMat->GetBufferPointer();

	// 頂点数分繰り返し
	for (int nCntMat = 0; nCntMat < (int)pXData->dwNumMat; nCntMat++)
	{
		// マテリアルの設定
		pDevice->SetMaterial(&pMat[nCntMat].MatD3D);

		// テクスチャの設定
		pDevice->SetTexture(0, CManager::GetInstance()->GetTexture()->GetAdress(m_nIdxTexture[nCntMat]));

		// パーツの描画
		pXData->pMesh->DrawSubset(nCntMat);
	}

	// シャドウマトリックス描画
	DrawShadowMtx();

	// 保存していたマテリアルを戻す
	pDevice->SetMaterial(&matDef);
}

//==========================================================================
// 描画処理
//==========================================================================
void CModel::Draw(D3DXCOLOR col)
{
	// デバイスの取得
	LPDIRECT3DDEVICE9 pDevice = CManager::GetInstance()->GetRenderer()->GetDevice();

	D3DMATERIAL9 matDef;			// 現在のマテリアル保存用
	D3DXMATERIAL *pMat;				// マテリアルデータへのポインタ
	D3DXMATERIAL matNow;			// 今回のマテリアル

	// 他の情報クリア
	ZeroMemory(&matNow, sizeof(D3DXMATERIAL));
	matNow.MatD3D.Diffuse = col;
	matNow.MatD3D.Ambient = col;

	// ワールドマトリックスの計算処理
	CalWorldMtx();

	// 現在のマテリアルを取得
	pDevice->GetMaterial(&matDef);

	// Xファイルのデータ取得
	CXLoad::SXFile *pXData = CScene::GetXLoad()->GetMyObject(m_nIdxXFile);

	// マテリアルデータへのポインタを取得
	pMat = (D3DXMATERIAL*)pXData->pBuffMat->GetBufferPointer();

	// 頂点数分繰り返し
	for (int nCntMat = 0; nCntMat < (int)pXData->dwNumMat; nCntMat++)
	{
		// マテリアルの設定
		pDevice->SetMaterial(&matNow.MatD3D);

		// テクスチャの設定
		pDevice->SetTexture(0, CManager::GetInstance()->GetTexture()->GetAdress(m_nIdxTexture[nCntMat]));

		// パーツの描画
		pXData->pMesh->DrawSubset(nCntMat);
	}


	// シャドウマトリックス描画
	DrawShadowMtx();

	// 保存していたマテリアルを戻す
	pDevice->SetMaterial(&matDef);
}

//==========================================================================
// 描画処理
//==========================================================================
void CModel::Draw(float fAlpha)
{
	// デバイスの取得
	LPDIRECT3DDEVICE9 pDevice = CManager::GetInstance()->GetRenderer()->GetDevice();

	D3DXMATRIX mtxRot, mtxTrans;	// 計算用マトリックス宣言
	D3DXMATRIX mtxRotOrigin;		// 計算用マトリックス宣言
	D3DMATERIAL9 matDef;			// 現在のマテリアル保存用
	D3DXMATERIAL *pMat;				// マテリアルデータへのポインタ
	D3DXMATRIX mtxnParent;			// 親の計算用マトリックス

	D3DXMATERIAL matNow;			// 今回のマテリアル

	// 他の情報クリア
	ZeroMemory(&matNow, sizeof(D3DXMATERIAL));

	// ワールドマトリックスの計算処理
	CalWorldMtx();

	// 現在のマテリアルを取得
	pDevice->GetMaterial(&matDef);

	// Xファイルのデータ取得
	CXLoad::SXFile *pXData = CScene::GetXLoad()->GetMyObject(m_nIdxXFile);

	// マテリアルデータへのポインタを取得
	pMat = (D3DXMATERIAL*)pXData->pBuffMat->GetBufferPointer();

	// 頂点数分繰り返し
	for (int nCntMat = 0; nCntMat < (int)pXData->dwNumMat; nCntMat++)
	{
		// 不透明度設定
		matNow.MatD3D.Diffuse = D3DXCOLOR(pMat[nCntMat].MatD3D.Diffuse.r, pMat[nCntMat].MatD3D.Diffuse.g, pMat[nCntMat].MatD3D.Diffuse.b, fAlpha);
		matNow.MatD3D.Ambient = D3DXCOLOR(pMat[nCntMat].MatD3D.Ambient.r, pMat[nCntMat].MatD3D.Ambient.g, pMat[nCntMat].MatD3D.Ambient.b, fAlpha);
		matNow.MatD3D.Emissive = pMat[nCntMat].MatD3D.Emissive;
		matNow.MatD3D.Power = pMat[nCntMat].MatD3D.Power;
		matNow.MatD3D.Specular = pMat[nCntMat].MatD3D.Specular;

		//マテリアルの設定
		pDevice->SetMaterial(&matNow.MatD3D);

		// テクスチャの設定
		pDevice->SetTexture(0, CManager::GetInstance()->GetTexture()->GetAdress(m_nIdxTexture[nCntMat]));

		// パーツの描画
		pXData->pMesh->DrawSubset(nCntMat);
	}


	// シャドウマトリックス描画
	DrawShadowMtx();

	// 保存していたマテリアルを戻す
	pDevice->SetMaterial(&matDef);
}

//==========================================================================
// テクスチャのインデックス割り当て
//==========================================================================
void CModel::SetIdxTexture(int i, int nIdx)
{
	m_nIdxTexture[i] = nIdx;
}

//==========================================================================
// テクスチャインデックス番号割り当て
//==========================================================================
int CModel::GetIdxTexture(int nIdx)
{
	return m_nIdxTexture[nIdx];
}

//==========================================================================
// マトリックス設定
//==========================================================================
void CModel::SetWorldMtx(const D3DXMATRIX mtx)
{
	m_mtxWorld = mtx;
}

//==========================================================================
// マトリックス取得
//==========================================================================
D3DXMATRIX CModel::GetWorldMtx(void) 
{
	return m_mtxWorld;
}

//==========================================================================
// ポインタマトリックス取得
//==========================================================================
D3DXMATRIX *CModel::GetPtrWorldMtx(void)
{
	return &m_mtxWorld;
}

//==========================================================================
// 位置設定
//==========================================================================
void CModel::SetPosition(const D3DXVECTOR3 pos)
{
	m_pos = pos;
}

//==========================================================================
// 位置取得
//==========================================================================
D3DXVECTOR3 CModel::GetPosition(void) const
{
	return m_pos;
}

//==========================================================================
// 位置設定
//==========================================================================
void CModel::SetOldPosition(const D3DXVECTOR3 posOld)
{
	m_posOld = posOld;
}

//==========================================================================
// 位置取得
//==========================================================================
D3DXVECTOR3 CModel::GetOldPosition(void) const
{
	return m_posOld;
}

//==========================================================================
// 元の位置設定
//==========================================================================
void  CModel::SetOriginPosition(const D3DXVECTOR3 pos)
{
	m_posOrigin = pos;
}

//==========================================================================
// 元の位置取得
//==========================================================================
D3DXVECTOR3  CModel::GetOriginPosition(void) const
{
	return m_posOrigin;
}

//==========================================================================
// 向き設定
//==========================================================================
void CModel::SetRotation(const D3DXVECTOR3 rot)
{
	m_rot = rot;
}

//==========================================================================
// 向き取得
//==========================================================================
D3DXVECTOR3 CModel::GetRotation(void) const
{
	return m_rot;
}

//==========================================================================
// 元の向き設定
//==========================================================================
void CModel::SetOriginRotation(const D3DXVECTOR3 rot)
{
	m_rotOrigin = rot;
}

//==========================================================================
// 元の向き取得
//==========================================================================
D3DXVECTOR3 CModel::GetOriginRotation(void) const
{
	return m_rotOrigin;
}

//==========================================================================
// スケール設定
//==========================================================================
void CModel::SetScale(const D3DXVECTOR3 scale)
{
	m_scale = scale;
}

//==========================================================================
// スケール取得
//==========================================================================
D3DXVECTOR3 CModel::GetScale(void) const
{
	return m_scale;
}

//==========================================================================
// 頂点の最大値取得
//==========================================================================
D3DXVECTOR3 CModel::GetVtxMax(void) const
{
	// Xファイルのデータ取得
	return CScene::GetXLoad()->GetMyObject(m_nIdxXFile)->vtxMax;
}

//==========================================================================
// 頂点の最小値取得
//==========================================================================
D3DXVECTOR3 CModel::GetVtxMin(void) const
{
	// Xファイルのデータ取得
	return CScene::GetXLoad()->GetMyObject(m_nIdxXFile)->vtxMin;
}

//==========================================================================
// モデルオブジェクトの取得
//==========================================================================
CModel *CModel::GetModel(void)
{
	return this;
}

//==========================================================================
// 総数取得
//==========================================================================
int CModel::GetNumAll(void)
{
	return m_nNumAll;
}
