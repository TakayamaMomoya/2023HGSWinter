//=============================================================================
// 
//  �I���t�G�w�b�_�[ [enemy_orafu.h]
//  Author : ���n�Ή�
// 
//=============================================================================

#ifndef _ENEMYORAFU_H_
#define _ENEMYORAFU_H_	// ��d�C���N���[�h�h�~

#include "enemy.h"

//==========================================================================
// �N���X��`
//==========================================================================
// �I���t�G�N���X��`
class CEnemyOrafu : public CEnemy
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
		MOTION_KNOCKBACK,		// ���ꃂ�[�V����
	};

	// �s����
	enum ACTION
	{
		ACTION_CHASE = 0,	// �Ǐ]
		ACTION_PROXIMITY,	// �ߐڍU��
		ACTION_WAIT,		// �ҋ@
		ACTION_MAX
	};

	CEnemyOrafu(int nPriority = mylib_const::ENEMY_PRIORITY);
	~CEnemyOrafu();

	// �I�[�o�[���C�h���ꂽ�֐�
	HRESULT Init(void) override;
	void Uninit(void) override;
	void Update(void) override;
	void Draw(void) override;
	void Kill(void) override;

private:


	//=============================
	// �֐����X�g
	//=============================
	typedef void(CEnemyOrafu::*ACT_FUNC)(void);
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
	bool m_bCatchUp;	// �ǂ���������
};



#endif