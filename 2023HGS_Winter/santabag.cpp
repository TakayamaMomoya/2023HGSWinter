//=============================================================================
// 
//  �T���^�̑܏��� [santabag.cpp]
//  Author : ���n�Ή�
// 
//=============================================================================
#include "santabag.h"
#include "manager.h"
#include "texture.h"
#include "renderer.h"
#include "sound.h"
#include "calculation.h"
#include "game.h"
#include "fade.h"

//==========================================================================
// �萔��`
//==========================================================================
namespace
{
	const char* BAGMODEL = "data\\MODEL\\santabag_01.x";
	const int MAX_LIFE = 10;	// �̗͂̍ő�l
	const float TIME_DMG = static_cast<float>(30) / static_cast<float>(60);			// �_���[�W���� 
	const float TIME_INVICIBLE = static_cast<float>(60) / static_cast<float>(60);	// ���G����
	const float NUM_TKTK = 10.0f;		// �`�J�`�J�����
}

//==========================================================================
// �֐��|�C���^
//==========================================================================
CSantaBag::STATE_FUNC CSantaBag::m_StateFuncList[] =
{
	&CSantaBag::StateNone,
	&CSantaBag::StateDamage,
	&CSantaBag::StateInvicible,
};

//==========================================================================
// �ÓI�����o�ϐ�
//==========================================================================
CListManager<CSantaBag> CSantaBag::m_List = {};	// ���X�g


//==========================================================================
// �R���X�g���N�^
//==========================================================================
CSantaBag::CSantaBag(int nPriority) : CObjectX(nPriority)
{
	// �l�̃N���A
	m_fStateTime = 0.0f;	// ��ԃJ�E���^�[
	m_state = STATE_NONE;	// ���
	m_MatCol = mylib_const::DEFAULT_COLOR;	// �}�e���A���J���[
	m_nLife = 0;			// ����
	m_nLifeMax = 0;			// �����̍ő�l
}

//==========================================================================
// �f�X�g���N�^
//==========================================================================
CSantaBag::~CSantaBag()
{
	
}

//==========================================================================
// ��������
//==========================================================================
CSantaBag *CSantaBag::Create(const D3DXVECTOR3 pos)
{
	// �����p�̃I�u�W�F�N�g
	CSantaBag *pBag = NULL;

	// �������̊m��
	pBag = DEBUG_NEW CSantaBag;

	if (pBag != NULL)
	{// �������̊m�ۂ��o���Ă�����

		// �ʒu���蓖��
		pBag->SetPosition(pos);

		// ����������
		pBag->Init();
	}

	return pBag;
}

//==========================================================================
// ����������
//==========================================================================
HRESULT CSantaBag::Init(void)
{
	// �e��ϐ��̏�����
	m_nLifeMax = MAX_LIFE;
	m_nLife = m_nLifeMax;	// ����

	// ���X�g�ɒǉ�
	m_List.Regist(this);

	// ��ނ̐ݒ�
	CObject::SetType(TYPE_OBJECTX);

	// ����������
	HRESULT hr = CObjectX::Init(BAGMODEL);
	if (FAILED(hr))
	{// ���s�����Ƃ�
		return E_FAIL;
	}
	return S_OK;
}

//==========================================================================
// �I������
//==========================================================================
void CSantaBag::Uninit(void)
{

	// ���X�g����폜
	m_List.Delete(this);

	// �I������
	CObjectX::Uninit();
}

//==========================================================================
// �X�V����
//==========================================================================
void CSantaBag::Update(void)
{
	// ��ԃJ�E���^�[���Z
	m_fStateTime -= CManager::GetInstance()->GetDeltaTime();

	// ��ԕʏ���
	(this->*(m_StateFuncList[m_state]))();

	if (m_nLife < 0)
	{
		// �N���A���s
		CGame::SetEnableClear(false);

		// �I������
		Uninit();

		// ���U���g�ɑJ��
		CManager::GetInstance()->GetFade()->SetFade(CScene::MODE_RESULT);
	}
}

//==========================================================================
// �Ȃɂ��Ȃ����
//==========================================================================
void CSantaBag::StateNone(void)
{
	// �ʏ�F�ɕύX
	m_MatCol = mylib_const::DEFAULT_COLOR;
	if (m_fStateTime <= 0.0f)
	{
		m_fStateTime = 0.0f;
	}
}

//==========================================================================
// �_���[�W���
//==========================================================================
void CSantaBag::StateDamage(void)
{
	// �ԐF�ɕύX
	m_MatCol = D3DXCOLOR(1.0f, 0.0f, 0.0f, 1.0f);

	if (m_fStateTime <= 0.0f)
	{
		m_state = STATE_INVINCIBLE;
		m_fStateTime = TIME_INVICIBLE;
	}
}

//==========================================================================
// ���G���
//==========================================================================
void CSantaBag::StateInvicible(void)
{
	// �ԐF�ɕύX
	m_MatCol = D3DXCOLOR(1.0f, 1.0f, 1.0f, sinf(D3DX_PI * (TIME_INVICIBLE - m_fStateTime) * NUM_TKTK));

	if (m_fStateTime <= 0.0f)
	{
		m_state = STATE_NONE;
		m_fStateTime = 0.0f;
	}
}

//==========================================================================
// �q�b�g����
//==========================================================================
void CSantaBag::Hit(void)
{
	if (m_state != STATE_NONE)
	{
		return;
	}

	// �̗͌��炷
	m_nLife--;

	// �_���[�W��Ԃɐݒ�
	m_state = STATE_DMG;
	m_fStateTime = TIME_DMG;

	// �܃_���[�W��
	CManager::GetInstance()->GetSound()->PlaySound(CSound::LABEL_SE_SANTABAG_DMG);
}

//==========================================================================
// �`�揈��
//==========================================================================
void CSantaBag::Draw(void)
{
	// �`��
	if (m_state == STATE_NONE)
	{
		CObjectX::Draw();
	}
	else
	{
		CObjectX::Draw(m_MatCol);
	}
}

//==========================================================================
// ���X�g�擾
//==========================================================================
std::list<CSantaBag*> CSantaBag::GetList(void)
{
	return m_List.GetList();
}

CListManager<CSantaBag> CSantaBag::GetListObj(void)
{
	return m_List;
}
