/* 2.sql */
/* 2. shachiku_nameが"i"で終わりbranch_idが1のshachikuhyoの記録を一覧表示 */
use sampledb;                       /* データベースsampledbを指定 */
select * from shachikuhyo
    where shachiku_name like "%i"   /* 最後の文字がiであるもの */
        and branch_id=1;
