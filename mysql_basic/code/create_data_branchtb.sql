# create_data_branchtb.sql
SHOW DATABASES;             /* データベースの一覧表示 */
USE sampledb;               /* sampledb を指定 */
CREATE table branchtb(      /* テーブルの作成 */
    branch_id CHAR(3) PRIMARY KEY,
    branch_name CHAR(10),
    jusho CHAR(30)
);
SHOW tables;                /* テーブルの確認 */
DESC branchtb;              /* テーブルbranchtb を表示 */
/*DESCRIBE branchtb;          /* これでも可能 /* */

INSERT INTO branchtb(       /* データの入力 */
    branch_id,
    branch_name,
    jusho
)
VALUES
('1',   'AAAA', 'TokyotoDDDD'),
('2',   'BBBB', 'TokyotoEEEE'),
('3',   'CCCC', 'TokyotoFFFF')
;
SELECT * FROM branchtb;  /* データの確認 */
