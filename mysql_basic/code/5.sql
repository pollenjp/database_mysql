/* 5.sql */
/* 5. branch_name ��"A"�Ŏn�܂�x�X�ɏ�������В{���̈ꗗ��\�� */
use sampledb;
select * from shachikuhyo 
join branchtb 
on shachikuhyo.branch_id = branchtb.branch_id
where branch_name like "A%";
