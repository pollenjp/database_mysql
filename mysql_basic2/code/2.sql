/* 2.sql */
use sampledb;
delimiter //
create procedure tekiseido(in id char(4))
begin
    select
    A.shachiku_id,
    (
        case
        when weight*10000/height/height < 18.5
            then 'Yasegata'
        when weight*10000/height/height < 25
            then 'Tekisei'
        else 'Himan'
        end 
    ) as doai
    from kenkosindantb as A
    where id=A.shachiku_id;
end
//
delimiter ;
