//=============================================================================
// 
//  �^�C�g����ʃw�b�_�[ [tutorial_screen.h]
//  Author : ���n�Ή�
// 
//=============================================================================

#ifndef _TUTORIALSCREEN_H_
#define _TUTORIALSCREEN_H_	// ��d�C���N���[�h�h�~

#include "main.h"
#include "object.h"

//==========================================================================
// �O���錾
//==========================================================================
class CObject2D;

//==========================================================================
// �}�N����`
//==========================================================================

//==========================================================================
// �N���X��`
//==========================================================================
// �w�i�N���X��`
class CTutorialScreen : public CObject
{
public:

	CTutorialScreen(int nPriority = 8);
	~CTutorialScreen();

	static CTutorialScreen *Create(void);

	// �I�[�o�[���C�h���ꂽ�֐�
	HRESULT Init(void);
	void Uninit(void);
	void Update(void);
	void Draw(void);

private:
	// �񋓌^��`
	enum VTX
	{
		VTX_BLACK = 0,	// ��
		VTX_LOGO_MAX
	};


	// �����o�ϐ�
	int m_nTexIdx[VTX_LOGO_MAX];						// �e�N�X�`���̃C���f�b�N�X�ԍ�
	CObject2D *m_pObj2D[VTX_LOGO_MAX];					// �I�u�W�F�N�g2D�̃I�u�W�F�N�g
	static const char *m_apTextureFile[VTX_LOGO_MAX];	// �e�N�X�`���̃t�@�C��
	bool m_bStick;		// �X�e�B�b�N�̔���
};



#endif