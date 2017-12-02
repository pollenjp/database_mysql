/* 4_2.sql */
use sampledb;
delimiter //
create procedure show4_2()
begin
    select
    A.shachiku_id,
    sum(B.uriage) as torihikigaku
    from shachikuhyo as A
    left outer join torihiki as B on A.shachiku_id=B.tantou
    group by A.shachiku_id
    ;
end
//
delimiter ;
