# create_data_torihiki.sql
SHOW DATABASES;             /* データベースの一覧表示 */
USE sampledb;               /* sampledb を指定 */
CREATE table torihiki(   /* テーブルの作成 */
    torihiki_id CHAR(4) PRIMARY KEY,
    uriage CHAR(4),
    tantou CHAR(4)
);
SHOW tables;                /* テーブルの確認 */
DESC torihiki;           /* テーブルtorihiki を表示 */
/*DESCRIBE torihiki;       /* これでも可能 /* */

INSERT INTO torihiki(    /* データの入力 */
    torihiki_id,
    uriage,
    tantou
)
VALUES
('1101', 500, 'a005'),
('1102', 300, 'a004'),
('1103', 100, 'a001'),
('1104', 300, 'a002'),
('1105', 300, 'a003'),
('1106', 900, 'a009'),
('1107', 600, 'a001'),
('1108', 600, 'a006')
;
SELECT * FROM torihiki;  /* データの確認 */






