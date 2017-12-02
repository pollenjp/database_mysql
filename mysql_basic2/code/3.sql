/* 3.sql */
use sampledb;
delimiter //
create procedure show3(in id char(4))
begin
    select
    A.shachiku_id,
    B.shachiku_name, 
    (
        case
        when weight*10000/height/height < 18.5
            then 'Yasegata'
        when weight*10000/height/height < 25
            then 'Tekisei'
        else 'Himan'
        end 
    ) as doai
    from kenkosindantb A join shachikuhyo B on A.shachiku_id=B.shachiku_id
    where id=A.shachiku_id;
end
//
delimiter ;
