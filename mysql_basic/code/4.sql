/* 4.sql */
/* shachikuhyo��branchtb������ */
use sampledb;
select * from shachikuhyo 
join branchtb 
on shachikuhyo.branch_id = branchtb.branch_id;
