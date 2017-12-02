# MySQLを少しだけかじる

## 目標
- ファイルに書かれたMySQL コマンドを実行
- データの作成
    - create_data_shachiku.sql
    - create_data_branchtb.sql
    - create_data_torihiki.sql
- 以下の操作を実行する
    1. shachikuhyoのshachiku_idとshachiku_nameと2017年末日における年齢を一覧表示
    2. shachiku_nameが"i"で終わりbranch_idが1のshachikuhyoの記録を一覧表示
    3. birthyearが1980以下または1995以上のshachikuhyoのshachiku_idとnameを表示
    4. shachikuhyoとbranchtbを結合
    5. branch_name が"A"で始まる支店に所属する社畜名の一覧を表示
    6. shachiku_name（社畜名）ごとに総売上を表示
    7. branch_name(支店名）ごとに総売上を表示 


## ファイルに書かれたMySQL コマンドを実行
<a href="https://dev.mysql.com/doc/refman/5.6/ja/mysql-batch-commands.html">MySQL5.6(公式)</a>

例：ルート権限でMySQLを操作する場合


```shell-session
mysql -u root -p < text_file.sql
```



```sql:text_file.sql
use db_name;
...
...
...
```


## データの作成

```mysql:create_data_shachiku.sql
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
```


```shell-session
# 実行結果
mysql> source create_data_shachikuhyo.sql
ERROR 1007 (HY000): Can't create database 'sampledb'; database exists # 既に作られているとこのエラーが出る
+--------------------+
| Database           |
+--------------------+
| information_schema |
| cdcol              |
| mysql              |
| performance_schema |
| phpmyadmin         |
| sampledb           |
| test               |
| testdb             |
| testdb1            |
| webauth            |
+--------------------+
10 rows in set (0.01 sec)

Database changed
Query OK, 0 rows affected (0.10 sec)

+--------------------+
| Tables_in_sampledb |
+--------------------+
| branchtb           |
| shachikuhyo        |
+--------------------+
2 rows in set (0.00 sec)

+---------------+----------+------+-----+---------+-------+
| Field         | Type     | Null | Key | Default | Extra |
+---------------+----------+------+-----+---------+-------+
| shachiku_id   | char(4)  | NO   | PRI | NULL    |       |
| shachiku_name | char(15) | YES  |     | NULL    |       |
| birth_year    | int(4)   | YES  |     | NULL    |       |
| branch_id     | char(3)  | YES  |     | NULL    |       |
+---------------+----------+------+-----+---------+-------+
4 rows in set (0.04 sec)

Query OK, 9 rows affected (0.06 sec)
Records: 9  Duplicates: 0  Warnings: 0

+-------------+---------------+------------+-----------+
| shachiku_id | shachiku_name | birth_year | branch_id |
+-------------+---------------+------------+-----------+
| a001        | Ai            |       1995 | 1         |
| a002        | Ue            |       1985 | 2         |
| a003        | Oka           |       1978 | 1         |
| a004        | Kiku          |       1980 | 3         |
| a005        | Keko          |       1981 | 2         |
| a006        | Sashi         |       1993 | 2         |
| a007        | Suse          |       1992 | 3         |
| a008        | Sota          |       1988 | 1         |
| a009        | Titsu         |       1987 | 1         |
+-------------+---------------+------------+-----------+
9 rows in set (0.00 sec)
```


```mysql:create_data_branchtb.sql
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
```

```shell-session
# 実行結果
mysql> source create_data_branchtb.sql
+--------------------+
| Database           |
+--------------------+
| information_schema |
| cdcol              |
| mysql              |
| performance_schema |
| phpmyadmin         |
| sampledb           |
| test               |
| testdb             |
| testdb1            |
| webauth            |
+--------------------+
10 rows in set (0.00 sec)

Database changed
Query OK, 0 rows affected (0.09 sec)

+--------------------+
| Tables_in_sampledb |
+--------------------+
| branchtb           |
+--------------------+
1 row in set (0.00 sec)

+-------------+----------+------+-----+---------+-------+
| Field       | Type     | Null | Key | Default | Extra |
+-------------+----------+------+-----+---------+-------+
| branch_id   | char(3)  | NO   | PRI | NULL    |       |
| branch_name | char(10) | YES  |     | NULL    |       |
| jusho       | char(30) | YES  |     | NULL    |       |
+-------------+----------+------+-----+---------+-------+
3 rows in set (0.06 sec)

Query OK, 3 rows affected (0.03 sec)
Records: 3  Duplicates: 0  Warnings: 0

+-----------+-------------+-------------+
| branch_id | branch_name | jusho       |
+-----------+-------------+-------------+
| 1         | AAAA        | TokyotoDDDD |
| 2         | BBBB        | TokyotoEEEE |
| 3         | CCCC        | TokyotoFFFF |
+-----------+-------------+-------------+
3 rows in set (0.00 sec)
```


```mysql:create_data_torihiki.sql
SHOW DATABASES;             /* データベースの一覧表示 */
USE sampledb;               /* sampledb を指定 */
CREATE table torihiki(   /* テーブルの作成 */
    torihiki_id CHAR(4) PRIMARY KEY,
    uriage CHAR(4),
    tantou CHAR(4)
);
SHOW tables;                /* テーブルの確認 */
DESC torihiki;           /* テーブルtorihiki を表示 */

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
```

```shell-session
# 実行結果
mysql> source create_data_torihiki.sql
+--------------------+
| Database           |
+--------------------+
| information_schema |
| cdcol              |
| mysql              |
| performance_schema |
| phpmyadmin         |
| sampledb           |
| test               |
| testdb             |
| testdb1            |
| webauth            |
+--------------------+
10 rows in set (0.02 sec)

Database changed
Query OK, 0 rows affected (0.17 sec)

+--------------------+
| Tables_in_sampledb |
+--------------------+
| branchtb           |
| shachikuhyo        |
| torihiki           |
+--------------------+
3 rows in set (0.00 sec)

+-------------+---------+------+-----+---------+-------+
| Field       | Type    | Null | Key | Default | Extra |
+-------------+---------+------+-----+---------+-------+
| torihiki_id | char(4) | NO   | PRI | NULL    |       |
| uriage      | char(4) | YES  |     | NULL    |       |
| tantou      | char(4) | YES  |     | NULL    |       |
+-------------+---------+------+-----+---------+-------+
3 rows in set (0.06 sec)

Query OK, 8 rows affected (0.04 sec)
Records: 8  Duplicates: 0  Warnings: 0

+-------------+--------+--------+
| torihiki_id | uriage | tantou |
+-------------+--------+--------+
| 1101        | 500    | a005   |
| 1102        | 300    | a004   |
| 1103        | 100    | a001   |
| 1104        | 300    | a002   |
| 1105        | 300    | a003   |
| 1106        | 900    | a009   |
| 1107        | 600    | a001   |
| 1108        | 600    | a006   |
+-------------+--------+--------+
8 rows in set (0.00 sec)
```


## shachikuhyoのbranch_idとshachikuhyoの記録を一覧表示する。


```sql:1.sql
/* 1.sql */
/* shachikuhyoのshachiku_idとshachiku_nameと2017年末日における年齢を一覧表示 */
use sampledb;
select shachiku_id, shachiku_name, (2017-birthyear) from shachikuhyo;
```

```shell-session
/* 実行結果 */
mysql> source 1.sql
Database changed
+-------------+---------------+-------------------+
| shachiku_id | shachiku_name | (2017-birth_year) |
+-------------+---------------+-------------------+
| a001        | Ai            |                22 |
| a002        | Ue            |                32 |
| a003        | Oka           |                39 |
| a004        | Kiku          |                37 |
| a005        | Keko          |                36 |
| a006        | Sashi         |                24 |
| a007        | Suse          |                25 |
| a008        | Sota          |                29 |
| a009        | Titsu         |                30 |
+-------------+---------------+-------------------+
9 rows in set (0.00 sec)
```

## shachiku_nameが"i"で終わりbranch_idが1のshachikuhyoの記録を一覧表示

```sql:2.sql
/* 2.sql */
/* 2. shachiku_nameが"i"で終わりbranch_idが1のshachikuhyoの記録を一覧表示 */
use sampledb;                       /* データベースsampledbを指定 */
select * from shachikuhyo
    where shachiku_name like "%i"   /* 最後の文字がiであるもの */
        and branch_id=1;
```

```shell-session
# 実行結果 
mysql> source 2.sql
Database changed
+-------------+---------------+------------+-----------+
| shachiku_id | shachiku_name | birth_year | branch_id |
+-------------+---------------+------------+-----------+
| a001        | Ai            |       1995 | 1         |
+-------------+---------------+------------+-----------+
1 row in set (0.00 sec)
```

## birthyearが1980以下または1995以上のshachikuhyoのshachiku_idとnameを表示

```sql:3.sql
/* 3.sql */
/* 3. birth_yearが1980以下または1995以上のshachikuhyoのshachiku_idとnameを表示 */
use sampledb;
select shachiku_id, shachiku_name from shachikuhyo A
where A.birth_year <= 1980 or A.birth_year >= 1995;
```

```shell-session
# 実行結果
mysql> source 3.sql
Database changed
+-------------+---------------+
| shachiku_id | shachiku_name |
+-------------+---------------+
| a001        | Ai            |
| a003        | Oka           |
| a004        | Kiku          |
+-------------+---------------+
3 rows in set (0.01 sec)
```

## 4. shachikuhyoとbranchtbを結合

```sql:4.sql
/* 4.sql */
/* shachikuhyoとbranchtbを結合 */
use sampledb;
select * from shachikuhyo 
join branchtb 
on shachikuhyo.branch_id = branchtb.branch_id;
```


```shell-session
# 実行結果
mysql> source 4.sql
Database changed
+-------------+---------------+------------+-----------+-----------+-------------+-------------+
| shachiku_id | shachiku_name | birth_year | branch_id | branch_id | branch_name | jusho       |
+-------------+---------------+------------+-----------+-----------+-------------+-------------+
| a001        | Ai            |       1995 | 1         | 1         | AAAA        | TokyotoDDDD |
| a002        | Ue            |       1985 | 2         | 2         | BBBB        | TokyotoEEEE |
| a003        | Oka           |       1978 | 1         | 1         | AAAA        | TokyotoDDDD |
| a004        | Kiku          |       1980 | 3         | 3         | CCCC        | TokyotoFFFF |
| a005        | Keko          |       1981 | 2         | 2         | BBBB        | TokyotoEEEE |
| a006        | Sashi         |       1993 | 2         | 2         | BBBB        | TokyotoEEEE |
| a007        | Suse          |       1992 | 3         | 3         | CCCC        | TokyotoFFFF |
| a008        | Sota          |       1988 | 1         | 1         | AAAA        | TokyotoDDDD |
| a009        | Titsu         |       1987 | 1         | 1         | AAAA        | TokyotoDDDD |
+-------------+---------------+------------+-----------+-----------+-------------+-------------+
9 rows in set (0.00 sec)
```

## 5. branch_name が"A"で始まる支店に所属する社畜名の一覧を表示

```sql:5.sql
/* 5.sql */
/* 5. branch_name が"A"で始まる支店に所属する社畜名の一覧を表示 */
use sampledb;
select * from shachikuhyo 
join branchtb 
on shachikuhyo.branch_id = branchtb.branch_id
where branch_name like "A%";
```

```shell-session
# 実行結果
mysql> source 5.sql
Database changed
+-------------+---------------+------------+-----------+-----------+-------------+-------------+
| shachiku_id | shachiku_name | birth_year | branch_id | branch_id | branch_name | jusho       |
+-------------+---------------+------------+-----------+-----------+-------------+-------------+
| a001        | Ai            |       1995 | 1         | 1         | AAAA        | TokyotoDDDD |
| a003        | Oka           |       1978 | 1         | 1         | AAAA        | TokyotoDDDD |
| a008        | Sota          |       1988 | 1         | 1         | AAAA        | TokyotoDDDD |
| a009        | Titsu         |       1987 | 1         | 1         | AAAA        | TokyotoDDDD |
+-------------+---------------+------------+-----------+-----------+-------------+-------------+
4 rows in set (0.00 sec)
```

## 6. shachiku_name（社畜名）ごとに総売上を表示

```sql:6.sql
/* 6.sql */
/* 6. shachiku_name（社畜名）ごとに総売上を表示 */
use sampledb;
select 
    A.shachiku_name,
    sum(B.uriage)
    from shachikuhyo A
    join torihiki B on A.shachiku_id=B.tantou
    group by A.shachiku_name;
```

```shell-session
# 実行結果
mysql> source 6.sql
Database changed
+---------------+---------------+
| shachiku_name | sum(B.uriage) |
+---------------+---------------+
| Ai            |           700 |
| Keko          |           500 |
| Kiku          |           300 |
| Oka           |           300 |
| Sashi         |           600 |
| Titsu         |           900 |
| Ue            |           300 |
+---------------+---------------+
7 rows in set (0.00 sec)
```

## 7. branch_name(支店名）ごとに総売上を表示 

```sql:7.sql
/* 7.sql */
/* 7. branch_name(支店名）ごとに総売上を表示  */
select
    C.branch_name,
    sum(B.uriage)
    from shachikuhyo as A
    join torihiki as B on A.shachiku_id=B.tantou
    join branchtb as C on A.branch_id=C.branch_id
    group by C.branch_id
    ;
```

```shell-session
# 実行結果
mysql> source 7.sql
+-------------+---------------+
| branch_name | sum(B.uriage) |
+-------------+---------------+
| AAAA        |          1900 |
| BBBB        |          1400 |
| CCCC        |           300 |
+-------------+---------------+
3 rows in set (0.03 sec)
```

