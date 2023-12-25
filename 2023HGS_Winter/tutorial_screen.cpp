//=============================================================================
// 
//  �^�C�g����ʏ��� [tutorial_screen.cpp]
//  Author : ���n�Ή�
// 
//=============================================================================
#include "tutorial_screen.h"
#include "manager.h"
#include "renderer.h"
#include "texture.h"
#include "object2D.h"
#include "calculation.h"
#include "input.h"

//==========================================================================
// �}�N����`
//==========================================================================
#define WIDTH		(640.0f)	// ����
#define HEIGHT		(360.0f)	// �c��
#define ALPHATIME	(60)		// �s�����x�X�V�̎���
#define LOGOMOVE_TIME	(180)	// ���S�ړ��̎���
#define SLASH_TIME		(60)	// �a���̎���
#define SLASH_MOVETIME	(8)		// �a���̈ړ�����
#define LOGO_POSITION	(D3DXVECTOR3(640.0f, 200.0f, 0.0f))
#define LOGOSIZE_MULTIPLY	(0.55f)
#define CHANGE_TIME		(40)

//==========================================================================
// �ÓI�����o�ϐ��錾
//==========================================================================
const char *CTutorialScreen::m_apTextureFile[VTX_LOGO_MAX] =			// �e�N�X�`���̃t�@�C��
{
	"data\\TEXTURE\\tutorial.png",
};

//==========================================================================
// �R���X�g���N�^
//==========================================================================
CTutorialScreen::CTutorialScreen(int nPriority) : CObject(nPriority)
{
	// �l�̃N���A
	memset(&m_pObj2D[0], NULL, sizeof(m_pObj2D));				// �I�u�W�F�N�g2D�̃I�u�W�F�N�g
	memset(&m_nTexIdx[0], 0, sizeof(m_nTexIdx));				// �e�N�X�`���̃C���f�b�N�X�ԍ�
	m_bStick = false;		// �X�e�B�b�N�̔���
}

//==========================================================================
// �f�X�g���N�^
//==========================================================================
CTutorialScreen::~CTutorialScreen()
{

}

//==========================================================================
// ��������
//==========================================================================
CTutorialScreen *CTutorialScreen::Create(void)
{
	// �����p�̃I�u�W�F�N�g
	CTutorialScreen *pTitleScreen = NULL;

	if (pTitleScreen == NULL)
	{// NULL��������

		// �������̊m��
		pTitleScreen = DEBUG_NEW CTutorialScreen;

		if (pTitleScreen != NULL)
		{// �������̊m�ۂ��o���Ă�����

			// ����������
			pTitleScreen->Init();
		}

		return pTitleScreen;
	}

	return NULL;
}

//==========================================================================
// ����������
//==========================================================================
HRESULT CTutorialScreen::Init(void)
{
	// ��ނ̐ݒ�
	SetType(CObject::TYPE_OBJECT2D);

	for (int nCntSelect = 0; nCntSelect < VTX_LOGO_MAX; nCntSelect++)
	{
		// ��������
		m_pObj2D[nCntSelect] = CObject2D::Create(8);

		// ��ނ̐ݒ�
		m_pObj2D[nCntSelect]->SetType(CObject::TYPE_OBJECT2D);

		// �e�N�X�`���̊��蓖��
		m_nTexIdx[nCntSelect] = CManager::GetInstance()->GetTexture()->Regist(m_apTextureFile[nCntSelect]);

		// �e�N�X�`���̊��蓖��
		m_pObj2D[nCntSelect]->BindTexture(m_nTexIdx[nCntSelect]);

		// �T�C�Y�ݒ�
		m_pObj2D[nCntSelect]->SetSize(D3DXVECTOR2(640.0f, 360.0f));	// �T�C�Y
		m_pObj2D[nCntSelect]->SetPosition(D3DXVECTOR3(640.0f, 360.0f, 0.0f));	// �ʒu
	}

	return S_OK;
}

//==========================================================================
// �I������
//==========================================================================
void CTutorialScreen::Uninit(void)
{
	for (int nCntSelect = 0; nCntSelect < VTX_LOGO_MAX; nCntSelect++)
	{
		if (m_pObj2D[nCntSelect] != NULL)
		{// NULL����Ȃ�������

			// �I������
			m_pObj2D[nCntSelect] = NULL;
		}
	}

	// ���폜
	Release();
}

//==========================================================================
// �X�V����
//==========================================================================
void CTutorialScreen::Update(void)
{

}

//==========================================================================
// �`�揈��
//==========================================================================
void CTutorialScreen::Draw(void)
{
	// �f�o�C�X�̎擾
	LPDIRECT3DDEVICE9 pDevice = CManager::GetInstance()->GetRenderer()->GetDevice();

	for (int nCntSelect = 0; nCntSelect < VTX_LOGO_MAX; nCntSelect++)
	{
		// �`�揈��
		m_pObj2D[nCntSelect]->Draw();
	}
}

