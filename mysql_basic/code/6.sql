/* 6.sql */
/* 6. shachiku_name（社畜名）ごとに総売上を表示 */
use sampledb;
select 
    A.shachiku_name,
    sum(B.uriage)
    from shachikuhyo A
    join torihiki B on A.shachiku_id=B.tantou
    group by A.shachiku_name;
