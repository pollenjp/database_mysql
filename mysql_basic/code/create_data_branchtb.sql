# create_data_branchtb.sql
SHOW DATABASES;             /* �f�[�^�x�[�X�̈ꗗ�\�� */
USE sampledb;               /* sampledb ���w�� */
CREATE table branchtb(      /* �e�[�u���̍쐬 */
    branch_id CHAR(3) PRIMARY KEY,
    branch_name CHAR(10),
    jusho CHAR(30)
);
SHOW tables;                /* �e�[�u���̊m�F */
DESC branchtb;              /* �e�[�u��branchtb ��\�� */
/*DESCRIBE branchtb;          /* ����ł��\ /* */

INSERT INTO branchtb(       /* �f�[�^�̓��� */
    branch_id,
    branch_name,
    jusho
)
VALUES
('1',   'AAAA', 'TokyotoDDDD'),
('2',   'BBBB', 'TokyotoEEEE'),
('3',   'CCCC', 'TokyotoFFFF')
;
SELECT * FROM branchtb;  /* �f�[�^�̊m�F */
