/* 5.sql */
/* 5. branch_name ‚ª"A"‚Ån‚Ü‚éx“X‚ÉŠ‘®‚·‚éĞ’{–¼‚Ìˆê——‚ğ•\¦ */
use sampledb;
select * from shachikuhyo 
join branchtb 
on shachikuhyo.branch_id = branchtb.branch_id
where branch_name like "A%";
