//=========================================================
//
// �g�i�J�C���� [reindeer.h]
// Author = �����đ�Y
//
//=========================================================
#ifndef _REINDEER_H_     // ���̃}�N����`������ĂȂ�������
#define _REINDEER_H_     // 2�d�C���N���[�h�h�~�̃}�N����`����

//===============================================
// �C���N���[�h
//===============================================
#include "enemy.h"

//===============================================
// �萔��`
//===============================================
namespace
{
	const int NUM_ENEMY = 5;		// ��������G�̑���
}

//===============================================
// �g�i�J�C�N���X
//===============================================
class CEnemyReindeer : public CEnemy
{
public:

	//=============================
	// �񋓌^��`
	//=============================
	//���[�V������
	enum MOTION
	{
		MOTION_DEF = 0,			// �j���[�g�������[�V����
		MOTION_WALK,			// �ړ����[�V����
		MOTION_PUNCH,			// �p���`���[�V����
		//MOTION_KNOCKBACK,		// ���ꃂ�[�V����
	};

	// �s����
	enum ACTION
	{
		ACTION_CHASE = 0,	// �Ǐ]
		ACTION_PROXIMITY,	// �ߐڍU��
		ACTION_WAIT,		// �ҋ@
		ACTION_MAX
	};

	CEnemyReindeer(int nPriority = mylib_const::ENEMY_PRIORITY);
	~CEnemyReindeer();

	// �I�[�o�[���C�h���ꂽ�֐�
	HRESULT Init(void) override;
	void Uninit(void) override;
	void Update(void) override;
	void Draw(void) override;
	void Kill(void) override;

	void SetAction(ACTION action) { m_Action = action; }	// �A�N�V�����ݒ�

private:


	//=============================
	// �֐����X�g
	//=============================
	typedef void(CEnemyReindeer::* ACT_FUNC)(void);
	static ACT_FUNC m_ActFuncList[];	// �s���֐����X�g

	//=============================
	// �����o�֐�
	//=============================
	// �s���֐�
	void ActionSet(void) override;		// �s���̐ݒ�
	void UpdateAction(void) override;	// �s���X�V
	void ActChase(void);				// �ǂ��|��
	void ActAttackProximity(void);		// �ߐڍU��
	void ActWait(void);					// �ҋ@

	// �s�����֐�
	void ChaseNormal(void);		// �����ǂ��|��
	void AttackPunch(void);		// �p���`�U��

	// ���̑��֐�
	void MotionSet(void) override;	// ���[�V�����̐ݒ�
	void RotationTarget(void);		// �^�[�Q�b�g�̕�������
	void AttackAction(int nModelNum, CMotion::AttackInfo ATKInfo) override;	// �U��������
	void AttackInDicision(CMotion::AttackInfo ATKInfo) override;			// �U�����蒆����

	//=============================
	// �����o�ϐ�
	//=============================
	ACTION m_Action;		// �s��
	float m_fActTime;		// �s���J�E���^�[
	float m_fSpeed;			// �ړ����x
	float m_fDashTime;		// ����܂ł̃J�E���^�[
	bool m_bCatchUp;	// �ǂ���������
};

#endif