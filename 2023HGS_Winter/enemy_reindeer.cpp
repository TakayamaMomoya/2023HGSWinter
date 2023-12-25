//=========================================================
//
// �g�i�J�C���� [enemy_reindeer.cpp]
// Author = �����đ�Y
//
//=========================================================

//===============================================
// �C���N���[�h
//===============================================
#include "enemy_reindeer.h"
#include "manager.h"
#include "calculation.h"

//==========================================================================
// �萔��`
//==========================================================================
namespace
{
	const float LENGTH_PUNCH = 300.0f;		// �p���`�̒���
	const float VELOCITY_WALK = 1.0f;		// ����
	const float VELOCITY_DASH = 1.5f;		// ����
	const float TIME_WAIT = 2.0f;			// �ҋ@
	const float TIME_DASH = 10.0f;			// ����܂ł̎���
}

//==========================================================================
// �֐��|�C���^
//==========================================================================
CEnemyReindeer::ACT_FUNC CEnemyReindeer::m_ActFuncList[] =
{
	&CEnemyReindeer::ActChase,			// �ǂ��|��
	&CEnemyReindeer::ActAttackProximity,	// �ߐ�
	&CEnemyReindeer::ActWait,				// �ҋ@
};

//==========================================================================
// �R���X�g���N�^
//==========================================================================
CEnemyReindeer::CEnemyReindeer(int nPriority) : CEnemy(nPriority)
{
	m_Action = ACTION_CHASE;	// �s��
	m_fActTime = 0.0f;			// �s���J�E���^�[
	m_fSpeed = 0.0f;			// �ړ����x
	m_fDashTime = 0.0f;			// ����܂ł̃J�E���^�[
	m_bCatchUp = false;			// �ǂ���������
}

//==========================================================================
// �f�X�g���N�^
//==========================================================================
CEnemyReindeer::~CEnemyReindeer()
{

}

//==========================================================================
// ����������
//==========================================================================
HRESULT CEnemyReindeer::Init(void)
{
	//����������
	CEnemy::Init();

	// �s��
	m_Action = ACTION_CHASE;

	// �ړ����x
	m_fSpeed = VELOCITY_WALK;

	return S_OK;
}

//==========================================================================
// �I������
//==========================================================================
void CEnemyReindeer::Uninit(void)
{
	// �I������
	CEnemy::Uninit();
}

//==========================================================================
// �E��
//==========================================================================
void CEnemyReindeer::Kill(void)
{
	// ���S����
	CEnemy::Kill();
}

//==========================================================================
// �X�V����
//==========================================================================
void CEnemyReindeer::Update(void)
{
	// ���S�̔���
	if (IsDeath() == true)
	{// ���S�t���O�������Ă�����
		return;
	}

	// �X�V����
	CEnemy::Update();

	m_fDashTime += CManager::GetInstance()->GetDeltaTime();

	if (TIME_DASH <= m_fDashTime)
	{// ��莞�Ԍo�ߌ�ɑ��x���グ��
		m_fSpeed = VELOCITY_DASH;
	}
}

//==========================================================================
// �s���ݒ�
//==========================================================================
void CEnemyReindeer::ActionSet(void)
{

}

//==========================================================================
// �s���X�V
//==========================================================================
void CEnemyReindeer::UpdateAction(void)
{
	// ��ԕʏ���
	(this->*(m_ActFuncList[m_Action]))();
}

//==========================================================================
// �ҋ@
//==========================================================================
void CEnemyReindeer::ActWait(void)
{
	// �ҋ@���[�V�����ݒ�
	m_pMotion->Set(MOTION_DEF);

	// �^�[�Q�b�g�̕�������
	RotationTarget();

	// �s���J�E���^�[���Z
	m_fActTime += CManager::GetInstance()->GetDeltaTime();

	if (TIME_WAIT <= m_fActTime)
	{// �ҋ@���Ԓ�������

		// �ߐڍU��
		m_fActTime = 0.0f;

		// �ǂ���������
		m_bCatchUp = CircleRange3D(GetPosition(), m_TargetPosition, LENGTH_PUNCH, 0.0f);
	}
}


//==========================================================================
// �ǂ��|��
//==========================================================================
void CEnemyReindeer::ActChase(void)
{
	// �ړ��t���O�𗧂Ă�
	m_sMotionFrag.bMove = true;

	// �^�[�Q�b�g�̕�������
	RotationTarget();

	// �s���ʈړ�����
	ChaseNormal();
}

//==========================================================================
// �����ǂ��|��
//==========================================================================
void CEnemyReindeer::ChaseNormal(void)
{
	// ���擾
	D3DXVECTOR3 move = GetMove();
	D3DXVECTOR3 rot = GetRotation();
	float fMove = GetVelocity();

	// �ړ��ʐݒ�
	move.x = sinf(D3DX_PI + rot.y) * fMove * m_fSpeed;
	move.z = cosf(D3DX_PI + rot.y) * fMove * m_fSpeed;

	// �ړ��ʐݒ�
	SetMove(move);
}

//==========================================================================
// �ߐڍU��
//==========================================================================
void CEnemyReindeer::ActAttackProximity(void)
{
	if (m_bCatchUp == false)
	{// �ǂ������ĂȂ���

		// �^�[�Q�b�g�̕�������
		RotationTarget();

		// �ړ��t���O�𗧂Ă�
		m_sMotionFrag.bMove = true;

		// �s������ׂ̍s���ʈړ�����
		ChaseNormal();

		// �s���ʈړ�����
		float fLength = 0.0f;
		fLength = LENGTH_PUNCH;

		// �ǂ���������
		m_bCatchUp = CircleRange3D(GetPosition(), m_TargetPosition, fLength, 0.0f);
	}
	else
	{// �U���̒�����

		// �U���t���O�𗧂Ă�
		m_sMotionFrag.bATK = true;

		// �s���ʈړ�����
		AttackPunch();
	}
}

//==========================================================================
// �p���`�U��
//==========================================================================
void CEnemyReindeer::AttackPunch(void)
{
	int nType = m_pMotion->GetType();
	if (nType == MOTION_PUNCH && m_pMotion->IsFinish() == true)
	{// �p���`�U�����I����Ă���

		// �ҋ@�s��
		m_Action = ACTION_WAIT;

		// �ҋ@���[�V�����ݒ�
		m_pMotion->Set(MOTION_DEF);

		// �ǂ������ĂȂ�����
		m_bCatchUp = false;
		return;
	}

	if (nType != MOTION_PUNCH)
	{
		// �p���`���[�V�����ݒ�
		m_pMotion->Set(MOTION_PUNCH);
	}

	// �U���t���O�𗧂Ă�
	m_sMotionFrag.bATK = true;
}

//==========================================================================
// �`�揈��
//==========================================================================
void CEnemyReindeer::Draw(void)
{
	// �`�揈��
	CEnemy::Draw();
}

//==========================================================================
// ���[�V�����Z�b�g
//==========================================================================
void CEnemyReindeer::MotionSet(void)
{
	if (m_pMotion->IsFinish() == true)
	{// �I�����Ă�����

		// ���݂̎�ގ擾
		int nType = m_pMotion->GetType();

		if (m_sMotionFrag.bMove == true && m_sMotionFrag.bKnockback == false && m_sMotionFrag.bATK == false)
		{// �ړ����Ă�����

			// �U�����Ă��Ȃ�
			m_sMotionFrag.bATK = false;

			// �s���ʐݒ菈��
			m_pMotion->Set(MOTION_WALK);
		}
		else if (m_sMotionFrag.bKnockback == true)
		{// ���ꒆ��������

			// ���ꃂ�[�V����
			//m_pMotion->Set(MOTION_KNOCKBACK);
		}
		else if (m_sMotionFrag.bATK == true)
		{// �U�����Ă�����

			// �U������OFF
			m_sMotionFrag.bATK = false;

			// �s���ʐݒ菈��
			m_pMotion->Set(MOTION_PUNCH);
		}
		//else
		//{
		//	// �j���[�g�������[�V����
		//	m_pMotion->Set(MOTION_DEF);
		//}
	}
}

//==========================================================================
// �^�[�Q�b�g�̕�������
//==========================================================================
void CEnemyReindeer::RotationTarget(void)
{
	// �ʒu�擾
	D3DXVECTOR3 pos = GetPosition();
	D3DXVECTOR3 rot = GetRotation();

	// �ڕW�̊p�x�����߂�
	float fRotDest = atan2f((pos.x - m_TargetPosition.x), (pos.z - m_TargetPosition.z));

	// �ڕW�Ƃ̍���
	float fRotDiff = fRotDest - rot.y;

	//�p�x�̐��K��
	RotNormalize(fRotDiff);

	//�p�x�̕␳������
	rot.y += fRotDiff * 0.1f;
	RotNormalize(rot.y);

	// �����ݒ�
	SetRotation(rot);

	// �ڕW�̌����ݒ�
	SetRotDest(fRotDest);
}

//==========================================================================
// �U��������
//==========================================================================
void CEnemyReindeer::AttackAction(int nModelNum, CMotion::AttackInfo ATKInfo)
{
	// ���[�V�������擾
	int nMotionType = m_pMotion->GetType();
	D3DXVECTOR3 weponpos = m_pMotion->GetAttackPosition(GetModel(), ATKInfo);

	// ���擾
	D3DXVECTOR3 pos = GetPosition();
	D3DXVECTOR3 rot = GetRotation();

	// ���[�V�����ʏ���
	switch (nMotionType)
	{
	case MOTION_PUNCH:
		break;
	}
}

//==========================================================================
// �U�����蒆����
//==========================================================================
void CEnemyReindeer::AttackInDicision(CMotion::AttackInfo ATKInfo)
{
	// ���̍U�����蒆����
	CEnemy::AttackInDicision(ATKInfo);

	// ���[�V�������擾
	int nMotionType = m_pMotion->GetType();
	D3DXVECTOR3 weponpos = m_pMotion->GetAttackPosition(GetModel(), ATKInfo);

	// ���[�V�����ʏ���
	switch (nMotionType)
	{
	case MOTION_PUNCH:
		break;
	}
}
