# create_data_torihiki.sql
SHOW DATABASES;             /* �f�[�^�x�[�X�̈ꗗ�\�� */
USE sampledb;               /* sampledb ���w�� */
CREATE table torihiki(   /* �e�[�u���̍쐬 */
    torihiki_id CHAR(4) PRIMARY KEY,
    uriage CHAR(4),
    tantou CHAR(4)
);
SHOW tables;                /* �e�[�u���̊m�F */
DESC torihiki;           /* �e�[�u��torihiki ��\�� */
/*DESCRIBE torihiki;       /* ����ł��\ /* */

INSERT INTO torihiki(    /* �f�[�^�̓��� */
    torihiki_id,
    uriage,
    tantou
)
VALUES
('1101', 500, 'a005'),
('1102', 300, 'a004'),
('1103', 100, 'a001'),
('1104', 300, 'a002'),
('1105', 300, 'a003'),
('1106', 900, 'a009'),
('1107', 600, 'a001'),
('1108', 600, 'a006')
;
SELECT * FROM torihiki;  /* �f�[�^�̊m�F */






