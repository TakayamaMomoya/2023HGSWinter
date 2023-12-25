//=============================================================================
// 
//  �G�̃}�l�[�W������ [enemymanager.cpp]
//  Author : ���n�Ή�
// 
//=============================================================================
#include "debugproc.h"
#include "enemymanager.h"
#include "calculation.h"
#include "manager.h"
#include "game.h"
#include "gamemanager.h"
#include "tutorial.h"
#include "renderer.h"
#include "enemy.h"
#include "enemy_boss.h"
#include "particle.h"
#include "fade.h"
#include "elevation.h"
#include "player.h"
#include "impactwave.h"
#include "camera.h"
#include "sound.h"
#include "enemybase.h"
#include "effect_enemyspawn.h"
#include "instantfade.h"
#include "stagecleartext.h"
#include "timer.h"

#include "listmanager.h"

//==========================================================================
// �}�N����`
//==========================================================================
#define SPAWN_STRENGTH	(100.0f)	// �X�|�[�����̍���
#define KILL_INT		(30)		// �|�����C���^�[�o��
#define INITIAL_TIME (3.0f)	// ��������
#define MIN_TIME (2.0f)	// �ŏ�����

//==========================================================================
// �ÓI�����o�ϐ��錾
//==========================================================================

//==========================================================================
// �R���X�g���N�^
//==========================================================================
CEnemyManager::CEnemyManager()
{
	// �l�̃N���A
	memset(&m_pEnemy[0], NULL, sizeof(m_pEnemy));		// �G�ւ̃|�C���^
	m_pBoss = NULL;										// �{�X
	memset(&m_aPattern[0], NULL, sizeof(m_aPattern));	// �z�u�̎��
	m_state = STATE_NONE;	// ���
	m_nCntSpawn = 0;		// �o���J�E���g
	m_nPatternNum = 0;		// �o���p�^�[����
	m_nNumChara = 0;		// �G�̎�ނ̑���
	m_nNumAll = 0;			// �G�̑���
	m_fTimer = 0.0f;		// �X�|�[���^�C�}�[
	m_fTimeSpawn = 0.0f;	// �X�|�[�����鎞��
	m_bChangeStage = false;	// �X�e�[�W�ύX����
}

//==========================================================================
// �f�X�g���N�^
//==========================================================================
CEnemyManager::~CEnemyManager()
{

}

//==========================================================================
// ��������
//==========================================================================
CEnemyManager *CEnemyManager::Create(const std::string pTextFile)
{
	// �����p�̃I�u�W�F�N�g
	CEnemyManager *pModel = NULL;

	if (pModel == NULL)
	{// NULL��������

		// �������̊m��
		pModel = DEBUG_NEW CEnemyManager;

		if (pModel != NULL)
		{// �������̊m�ۂ��o���Ă�����

			// ����������
			HRESULT hr = pModel->ReadText(pTextFile);
			if (FAILED(hr))
			{// ���s���Ă�����
				return NULL;
			}

			// ����������
			hr = pModel->Init();

			if (FAILED(hr))
			{// ���s���Ă�����
				pModel->Uninit();
				pModel = nullptr;
				return NULL;
			}
		}

		return pModel;
	}

	return NULL;
}

//==========================================================================
// ����������
//==========================================================================
HRESULT CEnemyManager::Init(void)
{
	m_fTimeSpawn = INITIAL_TIME;

	// �������Z�b�g
	m_nNumAll = 0;
	m_nCntSpawn = 0;

	// �X�e�[�W�ύX���ɂ���
	m_bChangeStage = false;

	// �J�ڏ�ԂɕύX
	//CGame::GetGameManager()->SetType(CGameManager::SCENE_TRANSITION);

	// �G���_�f�[�^�擾
	CEnemyBase *pEnemyBase = CGame::GetEnemyBase();

	if (pEnemyBase == NULL)
	{
		return E_FAIL;
	}

	// ���_�̐��擾
	int nNumBase = pEnemyBase->GetNumBase(0);

	//for (int i = 0; i < nNumBase; i++)
	//{
	//	// ���_���Ƃ̃f�[�^�擾
	//	CEnemyBase::sInfo sEnemyBaseInfo = pEnemyBase->GetEnemyBaseInfo(0, i);

	//	// �G�̔z�u
	//	SetEnemy(sEnemyBaseInfo.pos, sEnemyBaseInfo.rot, sEnemyBaseInfo.nPattern);
	//}


	// �ύX������Ȃ�����
	//SetEnableChangeStage(false);

	return S_OK;
}

//==========================================================================
// �I������
//==========================================================================
void CEnemyManager::Uninit(void)
{
	for (int nCntEnemy = 0; nCntEnemy < mylib_const::MAX_OBJ; nCntEnemy++)
	{
		if (m_pEnemy[nCntEnemy] != NULL)
		{
			m_pEnemy[nCntEnemy] = NULL;
		}
	}
}

//==========================================================================
// �j��
//==========================================================================
void CEnemyManager::Release(int nIdx)
{
	if (m_pEnemy[nIdx] != NULL)
	{
		m_pEnemy[nIdx] = NULL;
	}

	// �������Z
	m_nNumAll--;
}

//==========================================================================
// �j��
//==========================================================================
void CEnemyManager::Kill(void)
{
	for (int nCntEnemy = 0; nCntEnemy < mylib_const::MAX_OBJ; nCntEnemy++)
	{
		if (m_pEnemy[nCntEnemy] != NULL)
		{
			m_pEnemy[nCntEnemy]->Uninit();
			m_pEnemy[nCntEnemy] = NULL;
		}
	}
}

//==========================================================================
// �X�V����
//==========================================================================
void CEnemyManager::Update(void)
{
	if (m_nNumAll <= 0)
	{// �S���|���ꂽ��

		
	}

	// ���Ԃ̎擾
	m_fTimer += CManager::GetInstance()->GetDeltaTime();

	// �^�C���ɂ�銄�����v�Z
	float fRate =  0.0f;

	CTimer *pTimer = CTimer::GetInstance();

	if (pTimer != nullptr)
	{
		float fTime = pTimer->GetTime();

		fRate = fTime / START_TIME;
	}

	float fTime = INITIAL_TIME - (INITIAL_TIME - MIN_TIME) * (1.0f - fRate);

	if (m_fTimer >= fTime)
	{// �����_���ȓG�X�|�[��
		SetStageEnemy();

		m_fTimer = 0.0f;
	}

	// �e�L�X�g�̕`��
	CManager::GetInstance()->GetDebugProc()->Print(
		"---------------- �G��� ----------------\n"
		"�y�c��l���z[%d], �y�p�^�[�����z[%d]\n", m_nNumAll, m_nPatternNum);
}

//==========================================================================
// �X�e�[�W���̓G�z�u
//==========================================================================
void CEnemyManager::SetStageEnemy(void)
{
	// �Q�[���}�l�[�W���擾
	CGameManager *pGameManager = CGame::GetGameManager();

	if (pGameManager == NULL)
	{
		return;
	}

	// �X�e�[�W�̑����擾
	int nNumStage = pGameManager->GetNumStage();
	int nNowStage = pGameManager->GetNowStage();

	if (nNumStage <= nNowStage)
	{
		return;
	}

	// �G���_�f�[�^�擾
	CEnemyBase *pEnemyBase = CGame::GetEnemyBase();

	if (pEnemyBase == NULL)
	{
		return;
	}

	// ���_�̐��擾
	int nNumBase = pEnemyBase->GetNumBase(nNowStage);

	// ���_����
	int nBase = Random(0, nNumBase - 1);

	// ���_���Ƃ̃f�[�^�擾
	CEnemyBase::sInfo sEnemyBaseInfo = pEnemyBase->GetEnemyBaseInfo(nNowStage, nBase);

	// �G�̔z�u
	SetEnemy(sEnemyBaseInfo.pos, sEnemyBaseInfo.rot, sEnemyBaseInfo.nPattern);

	// �X�e�[�W���Z
	pGameManager->AddNowStage();
}

//==========================================================================
// �{�X�X�e�[�W�̓G�z�u
//==========================================================================
void CEnemyManager::SetStageBoss(void)
{
	// �G���_�f�[�^�擾
	CEnemyBase *pEnemyBase = CGame::GetEnemyBase();
	if (pEnemyBase == NULL)
	{
		return;
	}

	// ���_�̐��擾
	int nNumBase = pEnemyBase->GetNumBase(0);

	for (int i = 0; i < nNumBase; i++)
	{
		// ���_���Ƃ̃f�[�^�擾
		CEnemyBase::sInfo sEnemyBaseInfo = pEnemyBase->GetEnemyBaseInfo(0, i);

		// �G�̔z�u
		SetEnemy(sEnemyBaseInfo.pos, sEnemyBaseInfo.rot, sEnemyBaseInfo.nPattern);
	}
}

//==========================================================================
// �G�z�u
//==========================================================================
CEnemy **CEnemyManager::SetEnemy(D3DXVECTOR3 pos, D3DXVECTOR3 rot, int nPattern)
{
	int nNumSpawn = m_aPattern[nPattern].nNumEnemy;	// �X�|�[�����鐔
	int nCntNULL = 0;
	int nCntStart = 0;
	Pattern NowPattern = m_aPattern[nPattern];
	CEnemy *pEnemy[mylib_const::MAX_PATTEN_ENEMY];
	memset(&pEnemy[0], NULL, sizeof(pEnemy));

	for (int nCntEnemy = 0; nCntEnemy < nNumSpawn; nCntEnemy++)
	{
		for (nCntNULL = nCntStart; nCntNULL < mylib_const::MAX_OBJ; nCntNULL++, nCntStart++)
		{
			if (m_pEnemy[nCntNULL] != NULL)
			{// ��񂪓����Ă���
				continue;
			}

			int nType = NowPattern.EnemyData[nCntEnemy].nType;


			// �v�Z�p�}�g���b�N�X
			D3DXMATRIX mtxRot, mtxTrans, mtxWorld;

			// �}�g���b�N�X�̏�����
			D3DXMatrixIdentity(&mtxWorld);

			// �G���_�̌����𔽉f����
			D3DXMatrixRotationYawPitchRoll(&mtxRot, rot.y, rot.x, rot.z);
			D3DXMatrixMultiply(&mtxWorld, &mtxWorld, &mtxRot);

			// �p�^�[�����̈ʒu�𔽉f����
			D3DXMatrixTranslation(&mtxTrans, NowPattern.EnemyData[nCntEnemy].pos.x, NowPattern.EnemyData[nCntEnemy].pos.y, NowPattern.EnemyData[nCntEnemy].pos.z);
			D3DXMatrixMultiply(&mtxWorld, &mtxWorld, &mtxTrans);

			// �X�|�[�����̌������|�����킹��
			D3DXVECTOR3 spawnPos = D3DXVECTOR3(mtxWorld._41, mtxWorld._42, mtxWorld._43);

			// ���_�̈ʒu�����Z
			spawnPos += pos;

			// �G�̐���
			m_pEnemy[nCntNULL] = CEnemy::Create(
				nCntNULL,						// �C���f�b�N�X�ԍ�
				sMotionFileName[nType].c_str(),	// �t�@�C����
				spawnPos,						// �ʒu
				(CEnemy::TYPE)nType);			// ���

			if (m_pEnemy[nCntNULL] == NULL)
			{// ���s���Ă�����

				delete m_pEnemy[nCntNULL];
				m_pEnemy[nCntNULL] = NULL;
				break;
			}

			// �{�X�̏ꍇ�R�s�[
			if (nType == 0 && m_pBoss == NULL)
			{
				m_pBoss = (CEnemyBoss*)m_pEnemy[nCntNULL];
			}

			// �|�C���^�R�s�[
			pEnemy[nCntEnemy] = m_pEnemy[nCntNULL];

			// �����ݒ�
			m_pEnemy[nCntNULL]->SetRotation(rot);
			m_pEnemy[nCntNULL]->SetRotDest(rot.y);

			// �������Z
			m_nNumAll++;
			break;
		}
	}

	return &pEnemy[0];
}

//==========================================================================
// �p�^�[����
//==========================================================================
int CEnemyManager::GetPatternNum(void)
{
	return m_nPatternNum;
}

//==========================================================================
// �p�^�[���擾
//==========================================================================
CEnemyManager::Pattern CEnemyManager::GetPattern(int nPattern)
{
	return m_aPattern[nPattern];
}

//==========================================================================
// �G�̑����擾
//==========================================================================
int CEnemyManager::GetNumAll(void)
{
	return m_nNumAll;
}

//==========================================================================
// �e�L�X�g�ǂݍ��ݏ���
//==========================================================================
HRESULT CEnemyManager::ReadText(const std::string pTextFile)
{

	FILE *pFile = NULL;	// �t�@�C���|�C���^��錾

	// �t�@�C�����J��
	pFile = fopen(pTextFile.c_str(), "r");
	if (pFile == NULL)
	{//�t�@�C�����J�����ꍇ
		return E_FAIL;
	}

	char aComment[MAX_COMMENT];	// �R�����g
	int nType = 0;				// �z�u������
	int nCntPatten = 0;			// �p�^�[���̃J�E���g
	int nCntFileName = 0;

	memset(&m_aPattern[0], NULL, sizeof(m_aPattern));	// �ǂݍ��݃f�[�^
	m_nNumChara = 0;

	while (1)
	{// END_SCRIPT������܂ŌJ��Ԃ�

		// ������̓ǂݍ���
		fscanf(pFile, "%s", &aComment[0]);

		// �L�����N�^�[���̐ݒ�
		if (strcmp(aComment, "NUM_CHARACTER") == 0)
		{// NUM_CHARACTER��������

			fscanf(pFile, "%s", &aComment[0]);	// =�̕�
			fscanf(pFile, "%d", &m_nNumChara);	// �L�����N�^�[��
		}

		while (nCntFileName != m_nNumChara)
		{// ���f���̐����ǂݍ��ނ܂ŌJ��Ԃ�

			// ������̓ǂݍ���
			fscanf(pFile, "%s", &aComment[0]);

			// ���f�����̐ݒ�
			if (strcmp(aComment, "MOTION_FILENAME") == 0)
			{// NUM_MODEL��������

				fscanf(pFile, "%s", &aComment[0]);	// =�̕�
				fscanf(pFile, "%s", &aComment[0]);	// �t�@�C����

				// �t�@�C�����ۑ�
				sMotionFileName[nCntFileName] = aComment;

				nCntFileName++;	// �t�@�C�������Z
			}
		}

		// �e�p�^�[���̐ݒ�
		if (strcmp(aComment, "PATTERNSET") == 0)
		{// �z�u���̓ǂݍ��݂��J�n

			int nCntEnemy = 0;			// �G�̔z�u�J�E���g

			while (strcmp(aComment, "END_PATTERNSET") != 0)
			{// END_PATTERNSET������܂ŌJ��Ԃ�

				fscanf(pFile, "%s", &aComment[0]);	//�m�F����

				if (strcmp(aComment, "FIXEDMOVE") == 0)
				{// FIXEDMOVE����������̓����̎�ޓǂݍ���

					fscanf(pFile, "%s", &aComment[0]);	// =�̕�
					fscanf(pFile, "%d", &m_aPattern[nCntPatten].nFixedType);	// ���̓����̎��
				}

				if (strcmp(aComment, "ENEMYSET") == 0)
				{// ENEMYSET�œG���̓ǂݍ��݊J�n

					while (strcmp(aComment, "END_ENEMYSET") != 0)
					{// END_ENEMYSET������܂ŌJ��Ԃ�

						fscanf(pFile, "%s", &aComment[0]);	// �m�F����

						if (strcmp(aComment, "TYPE") == 0)
						{// TYPE��������L�����t�@�C���ԍ��ǂݍ���

							fscanf(pFile, "%s", &aComment[0]);	// =�̕�
							fscanf(pFile, "%d", &m_aPattern[nCntPatten].EnemyData[nCntEnemy].nType);	// �L�����t�@�C���ԍ�
						}

						if (strcmp(aComment, "POS") == 0)
						{// POS��������ʒu�ǂݍ���

							fscanf(pFile, "%s", &aComment[0]);		// =�̕�
							fscanf(pFile, "%f", &m_aPattern[nCntPatten].EnemyData[nCntEnemy].pos.x);	// X���W
							fscanf(pFile, "%f", &m_aPattern[nCntPatten].EnemyData[nCntEnemy].pos.y);	// Y���W
							fscanf(pFile, "%f", &m_aPattern[nCntPatten].EnemyData[nCntEnemy].pos.z);	// Z���W
						}

						if (strcmp(aComment, "STARTFRAME") == 0)
						{// STARTFRAME�������珉���t���[���ǂݍ���

							fscanf(pFile, "%s", &aComment[0]);	// =�̕�
							fscanf(pFile, "%d", &m_aPattern[nCntPatten].EnemyData[nCntEnemy].nStartFrame);	// �����t���[��
						}

					}// END_ENEMYSET�̂�����

					nCntEnemy++;	// �G�̃J�E���g�����Z
					m_aPattern[nCntPatten].nNumEnemy++;	// �G�̃J�E���g�����Z
				}
			}// END_PATTERNSET�̂�����

			nCntPatten++;	// �p�^�[�����Z
		}

		if (strcmp(aComment, "END_SCRIPT") == 0)
		{// �I�������Ń��[�v�𔲂���
			break;
		}
	}

	// �p�^�[����
	m_nPatternNum = nCntPatten;

	// �t�@�C�������
	fclose(pFile);

	return S_OK;
}

//==========================================================================
// �G�擾
//==========================================================================
CEnemy **CEnemyManager::GetEnemy(void)
{
	return &m_pEnemy[0];
}

//==========================================================================
// �{�X�擾
//==========================================================================
CEnemyBoss *CEnemyManager::GetBoss(void)
{
	return m_pBoss;
}

//==========================================================================
// �G�̃��[�V�����t�@�C�����擾
//==========================================================================
const char *CEnemyManager::GetMotionFilename(int nType)
{
	return &sMotionFileName[nType][0];
}
