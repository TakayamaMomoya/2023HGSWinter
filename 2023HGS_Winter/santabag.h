//=============================================================================
// 
//  �T���^�̑܃w�b�_�[ [santabag.h]
//  Author : ���n�Ή�
// 
//=============================================================================

#ifndef _SANTABAG_H_
#define _SANTABAG_H_	// ��d�C���N���[�h�h�~

#include "objectX.h"
#include "listmanager.h"

//==========================================================================
// �N���X��`
//==========================================================================
// �T���^�̑܃N���X��`
class CSantaBag : public CObjectX
{
public:

	CSantaBag(int nPriority = 6);
	~CSantaBag();

	// �I�[�o�[���C�h���ꂽ�֐�
	virtual HRESULT Init(void) override;
	virtual void Uninit(void) override;
	virtual void Update(void) override;
	virtual void Draw(void) override;

	// �����o�֐�
	void Hit(void);	// �q�b�g����

	// �ÓI�֐�
	static CSantaBag *Create(const D3DXVECTOR3 pos);
	static std::list<CSantaBag*> GetList(void);
	static CListManager<CSantaBag> GetListObj(void);

private:

	enum STATE
	{
		STATE_NONE = 0,		// �����Ȃ�
		STATE_DMG,			// �_���[�W
		STATE_INVINCIBLE,	// ���G
		STATE_MAX
	};

	//=============================
	// �֐����X�g
	//=============================
	typedef void(CSantaBag::*STATE_FUNC)(void);
	static STATE_FUNC m_StateFuncList[];	// ��Ԋ֐��̃��X�g

	//=============================
	// �����o�֐�
	//=============================
	// ��Ԋ֐�
	void StateNone(void);		// �Ȃɂ��Ȃ����
	void StateDamage(void);		// �_���[�W���
	void StateInvicible(void);	// ���G���


	//=============================
	// �����o�ϐ�
	//=============================
	float m_fStateTime;	// ��ԃJ�E���^�[
	STATE m_state;		// ���
	D3DXCOLOR m_MatCol;	// �}�e���A���J���[
	int m_nLife;		// ����
	int m_nLifeMax;		// �����̍ő�l
	static CListManager<CSantaBag> m_List;	// ���X�g

};


#endif