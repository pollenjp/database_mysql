/* 1.sql */
/* shachikuhyoのshachiku_idとshachiku_nameと2017年末日における年齢を一覧表示 */
use sampledb;
select shachiku_id, shachiku_name, (2017-birth_year) from shachikuhyo;
