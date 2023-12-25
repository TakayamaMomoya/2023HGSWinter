//==========================================================================
// 
//  �I���t�G���� [enemy_orafu.cpp]
//  Author : ���n�Ή�
// 
//==========================================================================
#include "enemy_orafu.h"
#include "manager.h"
#include "debugproc.h"
#include "calculation.h"
#include "particle.h"
#include "santabag.h"
#include "player.h"

//==========================================================================
// �萔��`
//==========================================================================
namespace
{
	const float LENGTH_PUNCH = 300.0f;		// �p���`�̒���
	const float LENGTH_PLAYERCHASE = 600.0f;	// �v���C���[�ǂ������鋗��
	const float VELOCITY_WALK = 1.0f;		// ����
	const float TIME_WAIT = 2.0f;			// �ҋ@
}

//==========================================================================
// �֐��|�C���^
//==========================================================================
CEnemyOrafu::ACT_FUNC CEnemyOrafu::m_ActFuncList[] =
{
	&CEnemyOrafu::ActChase,			// �ǂ��|��
	&CEnemyOrafu::ActAttackProximity,	// �ߐ�
	&CEnemyOrafu::ActWait,				// �ҋ@
};

//==========================================================================
// �R���X�g���N�^
//==========================================================================
CEnemyOrafu::CEnemyOrafu(int nPriority) : CEnemy(nPriority)
{
	m_Action = ACTION_CHASE;	// �s��
	m_fActTime = 0.0f;			// �s���J�E���^�[
	m_bCatchUp = false;			// �ǂ���������
}

//==========================================================================
// �f�X�g���N�^
//==========================================================================
CEnemyOrafu::~CEnemyOrafu()
{

}

//==========================================================================
// ����������
//==========================================================================
HRESULT CEnemyOrafu::Init(void)
{
	//����������
	CEnemy::Init();

	// �s��
	m_Action = ACTION_PROXIMITY;

	return S_OK;
}

//==========================================================================
// �I������
//==========================================================================
void CEnemyOrafu::Uninit(void)
{
	// �I������
	CEnemy::Uninit();
}

//==========================================================================
// �E��
//==========================================================================
void CEnemyOrafu::Kill(void)
{
	// ���S����
	CEnemy::Kill();
}

//==========================================================================
// �X�V����
//==========================================================================
void CEnemyOrafu::Update(void)
{
	// ���S�̔���
	if (IsDeath() == true)
	{// ���S�t���O�������Ă�����
		return;
	}

	// �X�V����
	CEnemy::Update();
}

//==========================================================================
// �s���ݒ�
//==========================================================================
void CEnemyOrafu::ActionSet(void)
{

}

//==========================================================================
// �s���X�V
//==========================================================================
void CEnemyOrafu::UpdateAction(void)
{
	// ��ԕʏ���
	(this->*(m_ActFuncList[m_Action]))();
}

//==========================================================================
// �ҋ@
//==========================================================================
void CEnemyOrafu::ActWait(void)
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
void CEnemyOrafu::ActChase(void)
{
	// �ړ��t���O�𗧂Ă�
	m_sMotionFrag.bMove = true;

	// �ʒu�擾
	D3DXVECTOR3 pos = GetPosition();

	// �v���C���[���
	CPlayer* pPlayer = CManager::GetInstance()->GetScene()->GetPlayer(m_nTargetPlayerIndex);
	if (pPlayer == NULL)
	{
		return;
	}

	// �~�̔���
	if (CircleRange2D(GetPosition(), pPlayer->GetPosition(), LENGTH_PLAYERCHASE, 0.0f))
	{
		m_TargetPosition = pPlayer->GetPosition();
	}
	else
	{
		// �o�b�O�̃��X�g�擾
		std::list<CSantaBag*> BagList = CSantaBag::GetList();

		// �v�f���J��Ԃ�
		for (const auto& bag : BagList)
		{
			m_TargetPosition = bag->GetPosition();
		}
	}

	// �^�[�Q�b�g�̕�������
	RotationTarget();

	// �s���ʈړ�����
	ChaseNormal();
}

//==========================================================================
// �����ǂ��|��
//==========================================================================
void CEnemyOrafu::ChaseNormal(void)
{
	// ���擾
	D3DXVECTOR3 move = GetMove();
	D3DXVECTOR3 rot = GetRotation();
	float fMove = GetVelocity();

	// �ړ��ʐݒ�
	move.x = sinf(D3DX_PI + rot.y) * fMove * VELOCITY_WALK;
	move.z = cosf(D3DX_PI + rot.y) * fMove * VELOCITY_WALK;

	// �ړ��ʐݒ�
	SetMove(move);
}

//==========================================================================
// �ߐڍU��
//==========================================================================
void CEnemyOrafu::ActAttackProximity(void)
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
void CEnemyOrafu::AttackPunch(void)
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
void CEnemyOrafu::Draw(void)
{
	// �`�揈��
	CEnemy::Draw();
}

//==========================================================================
// ���[�V�����Z�b�g
//==========================================================================
void CEnemyOrafu::MotionSet(void)
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
			m_pMotion->Set(MOTION_KNOCKBACK);
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
void CEnemyOrafu::RotationTarget(void)
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
void CEnemyOrafu::AttackAction(int nModelNum, CMotion::AttackInfo ATKInfo)
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
void CEnemyOrafu::AttackInDicision(CMotion::AttackInfo ATKInfo)
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
