/* 2.sql */
/* 2. shachiku_name��"i"�ŏI���branch_id��1��shachikuhyo�̋L�^���ꗗ�\�� */
use sampledb;                       /* �f�[�^�x�[�Xsampledb���w�� */
select * from shachikuhyo
    where shachiku_name like "%i"   /* �Ō�̕�����i�ł������ */
        and branch_id=1;
