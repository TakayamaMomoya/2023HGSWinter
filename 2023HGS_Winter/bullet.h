//=============================================================================
// 
//  弾ヘッダー [bullet.h]
//  Author : 相馬靜雅
// 
//=============================================================================

#ifndef _BULLET_H_
#define _BULLET_H_	// 二重インクルード防止

#include "main.h"
#include "meshsphere.h"

class CThunderRing;
class CObjectBillboard;

//==========================================================================
// クラス定義
//==========================================================================
// 弾クラス定義
class CBullet : public CMeshSphere
{
public:

	// 列挙型定義
	enum TYPE
	{
		TYPE_PLAYER = 0,	// プレイヤーの弾
		TYPE_ENEMY,		// 敵の弾
		TYPE_MAX
	};

	enum MOVETYPE
	{
		MOVETYPE_NORMAL = 0,	// 通常
		MOVETYPE_PARABOLA,		// 放物線
		MOVETYPE_MAX
	};

	enum STATE
	{
		STATE_NONE = 0,	// なにもなし
		STATE_DMG,		// 跳ね返し
		STATE_MAX
	};

	CBullet(int nPriority = 6);
	~CBullet();


	// オーバーライドされた関数
	virtual HRESULT Init(void);
	virtual void Uninit(void);
	virtual void Update(void);
	virtual void Draw(void);
	void SetVtx(void);

	void SetType(TYPE type);	// 種類設定
	TYPE GetType(void);			// 種類取得
	void SetState(STATE state, int nCntState);	// 状態設定
	STATE GetState(void);	// 状態取得
	void SetTargetPosition(D3DXVECTOR3 pos);	// 目標の位置
	void SetParabolaHeight(float fHeight);		// 放物線の最大高さ

	void SetReverseAutoDeath(void) { m_bAutoDeath = m_bAutoDeath ?  false : true; }	// 自動削除の判定削除
	bool IsFinish(void) { return m_bFinish; }					// 終了の判定

	static int GetNumAll(void);
	static CBullet *Create(TYPE type, MOVETYPE movetype, const D3DXVECTOR3 pos, const D3DXVECTOR3 rot, const D3DXVECTOR3 move, const float fSize);

private:
	void UpdatePos(void);		// 移動
	void UpdateTypePlayer(void);	// プレイヤー弾の更新
	void CollisionPlayer(void);		// プレイヤーとの判定
	void CollisionEnemy(void);		// 敵との判定
	
	void StateNone(void);		// 何もない状態
	void StateDamage(void);		// ダメージ状態処理


	TYPE m_type;				// 弾の種類
	STATE m_state;				// 状態
	MOVETYPE m_MoveType;		// 移動の種類
	D3DXVECTOR3 m_OriginPosition;	// 元の位置
	D3DXVECTOR3 m_TargetPosition;	// 目標の位置
	int m_nCntState;			// 状態遷移カウンター
	int m_nLife;				// 寿命
	int m_nLifeMax;				// 寿命の最大値
	int m_nTexIdx;				// テクスチャのインデックス番号
	int m_nCntEmission;			// 発生物のカウンター
	float m_fMaxParabolaHeight;	// 放物線の最大高さ
	bool m_bAutoDeath;		// 自動削除のフラグ
	bool m_bFinish;			// 終わった判定
	static int m_nNumAll;		// 弾の総数
	static const char *m_apTextureFile[TYPE_MAX];	// テクスチャのファイル

	typedef void(CBullet::*STATE_FUNC)(void);
	typedef void(CBullet::*COLLISION_FUNC)(void);
	static STATE_FUNC m_FuncList[];
	static COLLISION_FUNC m_CollisionFuncList[];	// 当たり判定のリスト
};


#endif