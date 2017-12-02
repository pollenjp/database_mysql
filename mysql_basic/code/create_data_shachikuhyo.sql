CREATE DATABASE sampledb;   /* データベース作成 */
SHOW DATABASES;             /* データベースの一覧表示 */
USE sampledb;               /* sampledb を指定 */
CREATE table shachikuhyo(   /* テーブルの作成 */
    shachiku_id CHAR(4) PRIMARY KEY,
    shachiku_name CHAR(15),
    birth_year INT(4),
    branch_id CHAR(3)
);
SHOW tables;                /* テーブルの確認 */
DESC shachikuhyo;           /* テーブルshachikuhyo を表示 */
/*DESCRIBE shachikuhyo;       /* これでも可能 /* */

INSERT INTO shachikuhyo(    /* データの入力 */
    shachiku_id,
    shachiku_name,
    birth_year,
    branch_id
)
VALUES
('a001', 'Ai',      1995, '1'),
('a002', 'Ue',      1985, '2'),
('a003', 'Oka',     1978, '1'),
('a004', 'Kiku',    1980, '3'),
('a005', 'Keko',    1981, '2'),
('a006', 'Sashi',   1993, '2'),
('a007', 'Suse',    1992, '3'),
('a008', 'Sota',    1988, '1'),
('a009', 'Titsu',   1987, '1')
;
SELECT * FROM shachikuhyo;  /* データの確認 */






