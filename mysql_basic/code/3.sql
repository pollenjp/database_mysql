/* 3.sql */
/* 3. birth_yearが1980以下または1995以上のshachikuhyoのshachiku_idとnameを表示 */
use sampledb;
select shachiku_id, shachiku_name from shachikuhyo A
where A.birth_year <= 1980 or A.birth_year >= 1995;
