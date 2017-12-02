/* 7.sql */
/* 7. branch_name(x“X–¼j‚²‚Æ‚É‘”„ã‚ğ•\¦  */
select
    C.branch_name,
    sum(B.uriage)
    from shachikuhyo as A
    join torihiki as B on A.shachiku_id=B.tantou
    join branchtb as C on A.branch_id=C.branch_id
    group by C.branch_id
    ;
