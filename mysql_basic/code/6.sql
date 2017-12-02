/* 6.sql */
/* 6. shachiku_nameiĞ’{–¼j‚²‚Æ‚É‘”„ã‚ğ•\¦ */
use sampledb;
select 
    A.shachiku_name,
    sum(B.uriage)
    from shachikuhyo A
    join torihiki B on A.shachiku_id=B.tantou
    group by A.shachiku_name;
