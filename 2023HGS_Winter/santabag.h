//=============================================================================
// 
//  サンタの袋ヘッダー [santabag.h]
//  Author : 相馬靜雅
// 
//=============================================================================

#ifndef _SANTABAG_H_
#define _SANTABAG_H_	// 二重インクルード防止

#include "objectX.h"
#include "listmanager.h"

//==========================================================================
// クラス定義
//==========================================================================
// サンタの袋クラス定義
class CSantaBag : public CObjectX
{
public:

	CSantaBag(int nPriority = 6);
	~CSantaBag();

	// オーバーライドされた関数
	virtual HRESULT Init(void) override;
	virtual void Uninit(void) override;
	virtual void Update(void) override;
	virtual void Draw(void) override;

	// メンバ関数
	void Hit(void);	// ヒット処理

	// 静的関数
	static CSantaBag *Create(const D3DXVECTOR3 pos);
	static std::list<CSantaBag*> GetList(void);
	static CListManager<CSantaBag> GetListObj(void);

private:

	enum STATE
	{
		STATE_NONE = 0,		// 何もなし
		STATE_DMG,			// ダメージ
		STATE_INVINCIBLE,	// 無敵
		STATE_MAX
	};

	//=============================
	// 関数リスト
	//=============================
	typedef void(CSantaBag::*STATE_FUNC)(void);
	static STATE_FUNC m_StateFuncList[];	// 状態関数のリスト

	//=============================
	// メンバ関数
	//=============================
	// 状態関数
	void StateNone(void);		// なにもない状態
	void StateDamage(void);		// ダメージ状態
	void StateInvicible(void);	// 無敵状態


	//=============================
	// メンバ変数
	//=============================
	float m_fStateTime;	// 状態カウンター
	STATE m_state;		// 状態
	D3DXCOLOR m_MatCol;	// マテリアルカラー
	int m_nLife;		// 寿命
	int m_nLifeMax;		// 寿命の最大値
	static CListManager<CSantaBag> m_List;	// リスト

};


#endif