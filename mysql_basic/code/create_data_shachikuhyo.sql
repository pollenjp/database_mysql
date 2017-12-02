CREATE DATABASE sampledb;   /* �f�[�^�x�[�X�쐬 */
SHOW DATABASES;             /* �f�[�^�x�[�X�̈ꗗ�\�� */
USE sampledb;               /* sampledb ���w�� */
CREATE table shachikuhyo(   /* �e�[�u���̍쐬 */
    shachiku_id CHAR(4) PRIMARY KEY,
    shachiku_name CHAR(15),
    birth_year INT(4),
    branch_id CHAR(3)
);
SHOW tables;                /* �e�[�u���̊m�F */
DESC shachikuhyo;           /* �e�[�u��shachikuhyo ��\�� */
/*DESCRIBE shachikuhyo;       /* ����ł��\ /* */

INSERT INTO shachikuhyo(    /* �f�[�^�̓��� */
    shachiku_id,
    shachiku_name,
    birth_year,
    branch_id
)
VALUES
('a001', 'Ai',      1995, '1'),
('a002', 'Ue',      1985, '2'),
('a003', 'Oka',     1978, '1'),
('a004', 'Kiku',    1980, '3'),
('a005', 'Keko',    1981, '2'),
('a006', 'Sashi',   1993, '2'),
('a007', 'Suse',    1992, '3'),
('a008', 'Sota',    1988, '1'),
('a009', 'Titsu',   1987, '1')
;
SELECT * FROM shachikuhyo;  /* �f�[�^�̊m�F */






