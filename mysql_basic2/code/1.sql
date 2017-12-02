/* 1.sql */
use sampledb;
delimiter //
create procedure calculate_bmi(in id char(4) )
    begin
    select 
    kenkosindantb.shachiku_id, weight*10000/height/height from kenkosindantb 
    where id=kenkosindantb.shachiku_id;
    end
    //
    delimiter ;
