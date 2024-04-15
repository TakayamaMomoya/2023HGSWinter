//=============================================================================
// 
//  �e�}�l�[�W���w�b�_�[ [bulletmanager.h]
//  Author : ���n�Ή�
// 
//=============================================================================

#ifndef _BULLETMANAGER_H_
#define _BULLETMANAGER_H_	// ��d�C���N���[�h�h�~

#include "constans.h"
#include "bullet.h"
#include "listmanager.h"

// �O���錾
class CBullet;

//==========================================================================
// �N���X��`
//==========================================================================
// �e�̃}�l�[�W���N���X��`
class CBulletManager
{
public:

	CBulletManager();
	~CBulletManager();

	HRESULT Init(void);
	void Uninit(void);

	void Regist(CBullet *pItem);			// ���蓖��
	void Delete(CBullet *pItem);			// �폜
	void KillAll(void);					// �S�č폜
	int GetNumAll(void);				// �A�C�e���̑����擾
	std::list<CBullet*> GetList(void);	// �A�C�e���̃��X�g�擾
	static CBulletManager *Create(void);	// ����

private:
	int m_nNumAll;		// �e�̑���
	CListManager<CBullet> m_List;	// ���X�g

};



#endif