/* 3.sql */
/* 3. birth_year��1980�ȉ��܂���1995�ȏ��shachikuhyo��shachiku_id��name��\�� */
use sampledb;
select shachiku_id, shachiku_name from shachikuhyo A
where A.birth_year <= 1980 or A.birth_year >= 1995;
