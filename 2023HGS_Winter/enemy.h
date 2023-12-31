//=============================================================================
// 
//  プレイヤーヘッダー [enemy.h]
//  Author : 相馬靜雅
// 
//=============================================================================

#ifndef _ENEMY_H_
#define _ENEMY_H_	// 二重インクルード防止

#include "main.h"
#include "objectChara.h"
#include "motion.h"
#include "enemymanager.h"
#include "resultmanager.h"

// 前方宣言
class CHP_Gauge;
class CShadow;
class CEffect3D;
class CEnemyFixedMoveManager;
class CList;

//==========================================================================
// クラス定義
//==========================================================================
// プレイヤークラス定義
class CEnemy : public CObjectChara
{
public:
	// 敵種類
	enum TYPE
	{
		TYPE_BOSS = 0,	// ボス
		TYPE_COOKIE,	// クッキー
		TYPE_REINDEER,	// トナカイ
		TYPE_ORAFU,		// オラフ
		TYPE_MAX
	};

	// 状態列挙
	enum STATE
	{
		STATE_NONE = 0,		// なにもない
		STATE_SPAWNWAIT,	// スポーン待機
		STATE_SPAWN,		// スポーン
		STATE_DMG,			// ダメージ
		STATE_DEAD,			// 死
		STATE_FADEOUT,		// フェードアウト
		STATE_PLAYERCHASE,	// プレイヤー追い掛け
		STATE_PARENTCHASE,	// 親追い掛け
		STATE_ATTACK,		// 攻撃
		STATE_WAIT,			// 待機
		STATE_BASECHANGE,	// 拠点切り替え
		STATE_MAX
	};

	// 行動列挙 : 金崎
	enum ACTION
	{
		ACTION_DEF = 0, //待機行動
		ACTION_ATTACK, //攻撃行動
		ACTION_SEARCH, //索敵行動
	};

	CEnemy(int nPriority = mylib_const::ENEMY_PRIORITY);
	virtual ~CEnemy();

	static CEnemy *Create(int nIdx, const char *pFileName, D3DXVECTOR3 pos, TYPE type = TYPE_BOSS);

	// オーバーライドされた関数
	virtual HRESULT Init(void) override;
	virtual void Uninit(void) override;
	virtual void Update(void) override;
	virtual void Draw(void) override;
	int GetState(void) override;
	void SetState(STATE state);		// 状態設定
	void SetState(STATE state, int nCntState);	// 状態設定
	int GetCharaType(void) override;	// 種類取得
	virtual bool Hit(const int nValue);

	void SetSpawnPosition(D3DXVECTOR3 pos);	// スポーン地点設定
	D3DXVECTOR3 GetSpawnPosition(void);	// スポーン地点取得
	void SetTargetPosition(D3DXVECTOR3 pos) { m_TargetPosition = pos; }	// 目標の位置設定

	HRESULT RoadText(const char *pFileName);
	virtual void Kill(void);	// 削除
	void SetParent(CEnemy *pParent);		// 親のポインタ設定
	void SetOriginRotation(D3DXVECTOR3 rot);	// 元の向き
	CEnemy *GetEnemy(void);

protected:

	enum COLORTYPE
	{
		COLORTYPE_NORMAL = 0,	// ノーマル
		COLORTYPE_POISON= 7,	// 毒キノコ
		COLORTYPE_LUCKY,		// 緑の1UP
		COLORTYPE_CONFUSION,	// 混乱攻撃
		COLORTYPE_SWIFTFOOT,	// 脚はやい
		COLORTYPE_TUTORIAL,		// チュートリアル
		COLORTYPE_MAX
	};

	// 拠点位置の種類
	enum eBaseType
	{
		BASETYPE_MAP = 0,	// マップに沿っている
		BASETYPE_ORIGIN,	// 出現位置
		BASETYPE_MAX
	};

	// モーションの判定
	struct SMotionFrag
	{
		bool bJump;			// ジャンプ中かどうか
		bool bATK;			// 攻撃中かどうか
		bool bKnockback;	// ノックバック中かどうか
		bool bMove;			// 移動中かどうか
		bool bCharge;		// チャージ中かどうか
	};

	// 隊列の構造体定義
	struct SFormationInfo
	{
		D3DXVECTOR3 pos;	// 隊列の位置
		float fAngle;		// 向き
		float fLength;		// 長さ
	};

	// マクロ定義
#define SPAWN_GRAVITY	(-0.25f)

	virtual void ProcessLanding(void);	// 着地時処理
	virtual void AttackAction(int nModelNum, CMotion::AttackInfo ATKInfo);	// 攻撃時処理
	virtual void AttackInDicision(CMotion::AttackInfo ATKInfo);				// 攻撃判定中処理
	virtual void ChaseMove(float fMove);	// 追い掛け移動
	virtual void RotationPlayer(void);		// プレイヤーを向く処理
	virtual bool CalcLenPlayer(float fLen); // プレイヤーとの距離判定
	virtual void MoveRotation(void);		// 移動方向を向く
	virtual void Move(void);				// 移動

	virtual void UpdateAction(void);		// 行動更新
	virtual void ActionSet(void) = 0;		// 行動の設定

	// 状態更新系
	virtual void StateNone(void);			// 何もない状態
	virtual void SpawnWait(void);			// スポーン待機
	virtual void Spawn(void);				// スポーン
	virtual void Damage(void);				// ダメージ
	virtual void Dead(void);				// 死亡
	virtual void FadeOut(void);				// フェードアウト
	virtual void PlayerChase(void);			// プレイヤー追従
	virtual void ParentChase(void);			// 親追従
	virtual void StateAttack(void);			// 攻撃処理
	virtual void TriggerChasePlayer(void);	// プレイヤー追従ONにするトリガー
	virtual void ChangeToAttackState(void);	// 攻撃状態移行処理
	virtual void StateWait(void);			// 待機処理
	virtual void ChangeBase(void);			// 拠点切り替え

	STATE m_state;							// 状態
	STATE m_Oldstate;						// 前回の状態
	int m_nCntState;						// 状態遷移カウンター
	int m_nTargetPlayerIndex;				// 追い掛けるプレイヤーのインデックス番号
	float m_fActCounter;						// 移動カウンター
	D3DXVECTOR3 m_posOrigin;				// 最初の位置
	D3DXVECTOR3 m_posKnokBack;				// ノックバックの位置
	SMotionFrag m_sMotionFrag;				// モーションのフラグ
	CHP_Gauge *m_pHPGauge;					// HPゲージの情報
	CMotion *m_pMotion;						// モーションの情報
	COLORTYPE m_colorType;					// 色ごとの種類
	CEnemy *m_pParent;		// 親のポインタ
	D3DXCOLOR m_mMatcol;	// マテリアルの色
	D3DXVECTOR3 m_TargetPosition;	// 目標の位置
private:

	typedef enum
	{
		MOTION_DEF = 0,		// ニュートラルモーション
		MOTION_WALK,		// 移動モーション
		MOTION_ATK,			// 攻撃
		MOTION_KNOCKBACK,	// やられモーション
		MOTION_FADEOUT,		// 土帰還
		MOTION_MAX
	}MOTION;
	
	void UpdateState(void);					// 状態更新処理
	virtual void UpdateStateByType(void);	// 種類別状態更新処理
	virtual void UpdateByType(void);		// 種類別更新処理
	void Collision(void);					// 当たり判定
	virtual void CollisionPlayer(void);		// プレイヤーとの当たり判定
	virtual void MotionSet(void) = 0;		// モーションの設定
	void RegistrChild(CEnemy *pChild);
	void ResetChild(CEnemy *pChild);
	void Atack(void);		// 攻撃
	void LimitArea(void); // 大人の壁判定

	TYPE m_type;			// 種類
	SFormationInfo m_sFormationInfo;	// 隊列の情報
	D3DXVECTOR3 m_rotOrigin;	// 最初の向き
	int m_nTexIdx;			// テクスチャのインデックス番号
	int m_nNumChild;		// 子の数
	int m_nIdxManager;		// マネージャのインデックス番号
	bool m_bAddScore;		// スコア加算するかの判定
	int m_nBallastEmission;	// 瓦礫の発生カウンター
	CEnemy *m_pChild[mylib_const::MAX_ENEMY];	// 子のポインタ
	CShadow *m_pShadow;			// 影の情報
	CList *m_pList;				// リストのオブジェクト
};



#endif