/* 6.sql */
/* 6. shachiku_name�i�В{���j���Ƃɑ������\�� */
use sampledb;
select 
    A.shachiku_name,
    sum(B.uriage)
    from shachikuhyo A
    join torihiki B on A.shachiku_id=B.tantou
    group by A.shachiku_name;
