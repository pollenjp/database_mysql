/* 3.sql */
/* 3. birth_year‚ª1980ˆÈ‰º‚Ü‚½‚Í1995ˆÈã‚Ìshachikuhyo‚Ìshachiku_id‚Æname‚ğ•\¦ */
use sampledb;
select shachiku_id, shachiku_name from shachikuhyo A
where A.birth_year <= 1980 or A.birth_year >= 1995;
