/* 5.sql */
/* 5. branch_name が"A"で始まる支店に所属する社畜名の一覧を表示 */
use sampledb;
select * from shachikuhyo 
join branchtb 
on shachikuhyo.branch_id = branchtb.branch_id
where branch_name like "A%";
