//=============================================================================
// 
//  �^�C�}�[���� [timer.cpp]
//  Author : ���n�Ή�
// 
//=============================================================================
#include "timer.h"
#include "manager.h"
#include "texture.h"
#include "renderer.h"
#include "object2D.h"
#include "multinumber.h"
#include "fade.h"
#include "debugproc.h"
#include "calculation.h"
#include "game.h"
#include "gamemanager.h"

//==========================================================================
// �萔��`
//==========================================================================
namespace
{
	const char* TEXTURE = "data\\TEXTURE\\number\\degital_01.png";	// �e�N�X�`���̃t�@�C��
	const char* TEXTURE_WINDOW = "data\\TEXTURE\\timerwindow.png";		// �E�B���h�E�e�N�X�`���̃t�@�C��
	const D3DXVECTOR3 DEST_POSITION = D3DXVECTOR3(1100.0f, 100.0f, 0.0f);
	const float START_RATIO = 4.5;			// ��������
	const float DEST_RATIO_WINDOW = 0.1f;	// �ڕW�̃E�B���h�E����
	const float WIDTH = 25.0f;			// ����
	const float HEIGHT = 25.0f;			// �c��
	const float DIS_RATIO_Y = 0.3f;			// Y�̊Ԋu
	const int NUM_TIMER = 2;			// ����
	const int MAX_TIME = 60 * 99;		// �^�C�}�[�̍ő吔
	const int START_TIME = 60 * 30;		// �^�C�}�[�̏����l
	const float TIME_APPEARANCE = 0.7f;	// �o������
	const float TIME_ADDLITTLE = 2.0f;	// �������Z����
	const float TIME_ADJUSTMENT = 0.5f;	// ��������
}

//==========================================================================
// �֐����X�g
//==========================================================================
CTimer::STATE_FUNC CTimer::m_StateFuncList[] =
{
	&CTimer::StateWait,			// �ҋ@
	&CTimer::StatAppearance,	// �o��
	&CTimer::StatAddLittle,		// �������Z
	&CTimer::StateAdjustment,	// ����
};

//==========================================================================
// �R���X�g���N�^
//==========================================================================
CTimer::CTimer(int nPriority)
{
	// �l�̃N���A
	m_state = STATE_WAIT;		// ���
	m_fStateTime = 0.0f;		// ��Ԏ���
	m_fTime = 0.0f;				// ����
	m_pos = mylib_const::DEFAULT_VECTOR3;	// �ʒu
	m_posOrigin = mylib_const::DEFAULT_VECTOR3;	// ���̈ʒu
	m_bAddTime = false;			// �^�C�}�[���Z�̃t���O
}

//==========================================================================
// �f�X�g���N�^
//==========================================================================
CTimer::~CTimer()
{

}

//==========================================================================
// ��������
//==========================================================================
CTimer *CTimer::Create(void)
{
	// �����p�̃I�u�W�F�N�g
	CTimer *pScore = NULL;

	if (pScore == NULL)
	{// NULL��������

		// �������̊m��
		pScore = DEBUG_NEW CTimer;

		if (pScore != NULL)
		{// �������̊m�ۂ��o���Ă�����

			// ����������
			pScore->Init(mylib_const::DEFAULT_VECTOR3);
		}

		return pScore;
	}

	return NULL;
}

//==========================================================================
// ��������
//==========================================================================
CTimer *CTimer::Create(D3DXVECTOR3 pos)
{
	// �����p�̃I�u�W�F�N�g
	CTimer *pScore = NULL;

	if (pScore == NULL)
	{// NULL��������

		// �������̊m��
		pScore = DEBUG_NEW CTimer;

		if (pScore != NULL)
		{// �������̊m�ۂ��o���Ă�����

			// ����������
			pScore->Init(pos);
		}

		return pScore;
	}

	return NULL;
}

//==========================================================================
// ����������
//==========================================================================
HRESULT CTimer::Init(D3DXVECTOR3 pos)
{

	// �e��ϐ�������
	m_pos = pos;
	m_posOrigin = m_pos;	// ���̈ʒu
	m_fTime = START_TIME;	// ����
	m_state = STATE_WAIT;			// ���
	m_bAddTime = true;			// �^�C�}�[���Z�̃t���O
	D3DXCOLOR setcolor = D3DXCOLOR(1.0f, 1.0f, 1.0f, 0.0f);

	return S_OK;
}

//==========================================================================
// �I������
//==========================================================================
void CTimer::Uninit(void)
{

}

//==========================================================================
// �X�V����
//==========================================================================
void CTimer::Update(void)
{
	// ��ԕʏ���
	(this->*(m_StateFuncList[m_state]))();

	if (!m_bAddTime)
	{
		return;
	}

	// ���Ԍ��Z
	float fDeltaTime = CManager::GetInstance()->GetDeltaTime();

	if (fDeltaTime <= 10)
	{
		m_fTime -= fDeltaTime;
		ValueNormalize(m_fTime, static_cast<float>(MAX_TIME), 0.0f);

		// ���A�b�A�~���b�̌v�Z
		int minutes = static_cast<int>(m_fTime) / (60);
		int seconds = (static_cast<int>(m_fTime) % (60));
		int milliseconds = static_cast<int>(m_fTime) % 1000;

		// �f�o�b�O�\��
		CManager::GetInstance()->GetDebugProc()->Print(
			"------------------[���ԁF%d���A%d�b�A%d]------------------\n", minutes, seconds, milliseconds);
	}

}

//==========================================================================
// �ҋ@���
//==========================================================================
void CTimer::StateWait(void)
{
	// ���ԃ��Z�b�g
	m_fStateTime = 0.0f;
}

//==========================================================================
// �o�����
//==========================================================================
void CTimer::StatAppearance(void)
{
	// ���ԉ��Z
	m_fStateTime += CManager::GetInstance()->GetDeltaTime();

	if (m_fStateTime >= TIME_APPEARANCE)
	{
		// ��ԑJ��
		m_state = STATE_ADD_LITTLE;
		m_fStateTime = 0.0f;

		// �^�C�}�[��i�߂�
		m_bAddTime = true;
	}
}

//==========================================================================
// �������Z���
//==========================================================================
void CTimer::StatAddLittle(void)
{
	// ���ԉ��Z
	m_fStateTime += CManager::GetInstance()->GetDeltaTime();

	if (m_fStateTime >= TIME_ADDLITTLE)
	{
		// ��ԑJ��
		m_state = STATE_ADJ;
		m_fStateTime = 0.0f;
		CGame::GetGameManager()->SetType(CGameManager::SCENE_MAIN);
	}
}

//==========================================================================
// �������
//==========================================================================
void CTimer::StateAdjustment(void)
{
	// ���ԉ��Z
	m_fStateTime += CManager::GetInstance()->GetDeltaTime();

	m_pos.x = EasingLinear(m_posOrigin.x, DEST_POSITION.x, m_fStateTime / TIME_ADJUSTMENT);
	m_pos.y = EasingLinear(m_posOrigin.y, DEST_POSITION.y, m_fStateTime / TIME_ADJUSTMENT);

	D3DXVECTOR3 setpos = m_pos;

	if (m_fStateTime >= TIME_ADJUSTMENT)
	{
		// ��ԑJ��
		m_state = STATE_WAIT;
		m_fStateTime = 0.0f;
	}
}

//==========================================================================
// �`�揈��
//==========================================================================
void CTimer::Draw(void)
{

}
