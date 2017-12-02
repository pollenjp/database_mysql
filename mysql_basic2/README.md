# MySQL

<a href="https://qiita.com/pollenjp/items/477cc0e48d98769b7637">MySQLを少しかじる</a>

## 目的
- csvファイルからデータを取り込む
    - データベースsampledbを作成して
    - 4つのテーブルshachikuhyo, branchtb, torihiki, kenkosindantbをcsvファイルから取り込む
- procedure（ストアドプロシージャ）の基本操作
    1. BMIを求めるプロシージャを作る
    2. BMIを基準に「やせ型・適正・肥満」に分類するプロシージャを作る
- 復習もかねて
    3. BMIとともにshachiku_idも一覧表示
    4. sumを使ったプロシージャ


# csvファイルからデータを取り込む

## データベースsampledbを作成して

```shell-session
mysql> create database sampledb;
```

## 4つのテーブルshachikuhyo, branchtb, torihiki, kenkosindanをcsvファイルから取り込む

```shell-session
mysql> use sampledb;
```

```sql:create_tb_shachikuhyo.mysql 
/* create_tb_shachikuhyo.mysql */
use testdb;
CREATE table shachikuhyo(
    shachiku_id CHAR(4) PRIMARY KEY,
    shachiku_name CHAR(15),
    birth_year INT(4),
    branch_id CHAR(3)
);
```

```sql:create_tb_branchtb.mysql
/* create_tb_branchtb.mysql */
use testdb;
CREATE table branchtb(
    branch_id CHAR(3) PRIMARY KEY,
    branch_name CHAR(10),
    jusho CHAR(30)
);
```

```sql:create_tb_torihiki.mysql
/* create_tb_torihiki.mysql */
use testdb;
CREATE table torihiki(
    torihiki_id CHAR(4) PRIMARY KEY,
    uriage CHAR(4),
    tantou CHAR(4)
);
```

```sql:create_tb_kenkosindatadb.mysql
/* create_tb_kenkosindatadb.mysql */
use testdb;
create table kenkosindantb(
shainid char(4) primary key,
height int(3),
weight int(3)
);
```

以下ではcsvファイルをテーブルに格納している。
shachikuhyo.csvファイル ==>     shachikuhyo
branch.csvファイル      ==>     branchtb
torihiki.csvファイル    ==>     torihiki
kenkosinan.csvファイル  ==>     kenkosindantb

```shell-session
mysql> load data infile 'shachikuhyo.csv'   into table shachikuhyo      fields terminated by ',' lines terminated by x'0D0A'
mysql> load data infile 'branch.csv'        into table branchtb         fields terminated by ',' lines terminated by x'0D0A'
mysql> load data infile 'torihiki.csv'      into table torihiki         fields terminated by ',' lines terminated by x'0D0A'
mysql> load data infile 'kenkosindan.csv'   into table kenkosindantb    fields terminated by ',' lines terminated by x'0D0A'
```
これによりデータは格納できた

# procedure（ストアドプロシージャ）の基本操作
## 1. BMIを求めるプロシージャを作る

```sql:1.sql
/* 1.sql */
use sampledb;
delimiter //
create procedure calculate_bmi(in id char(4) )
    begin
    select 
    kenkosindantb.shachiku_id, weight*10000/height/height from kenkosindantb 
    where id=kenkosindantb.shachiku_id;
    end
    //
    delimiter ;
```

```shell-session
mysql> source 1.sql
Database changed
Query OK, 0 rows affected (0.00 sec)

mysql> call calculate_bmi('a001');
+-------------+----------------------------+
| shachiku_id | weight*10000/height/height |
+-------------+----------------------------+
| a001        |                18.02595738 |
+-------------+----------------------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.01 sec)
```

## 2. BMIを基準に「やせ型・適正・肥満」に分類するプロシージャを作る

```sql:2.sql
/* 2.sql */
use sampledb;
create procedure kadai2(in id char(4))
begin
    select
    A.shachiku_id,
    (
        case
        when weight*10000/height/height < 18.5
            then 'Yasegata'
        when weight*10000/height/height < 25
            then 'Tekisei'
        else 'Himan'
        end 
    ) as doai
    from kenkosindantb A
    where id=A.shachiku_id;
end
//
delimiter ;
```

```shell-session
mysql> source 2.sql
Database changed
Query OK, 0 rows affected (0.00 sec)

mysql> call tekiseido('a001');
+-------------+----------+
| shachiku_id | doai     |
+-------------+----------+
| a001        | Yasegata |
+-------------+----------+
1 row in set (0.00 sec)
```


# 復習もかねて
## 3. BMIとともにshachiku_idも一覧表示

```sql:3.sql
/* 3.sql */
use sampledb;
delimiter //
create procedure show3(in id char(4))
begin
    select
    A.shachiku_id,
    B.shachiku_name, 
    (
        case
        when weight*10000/height/height < 18.5
            then 'Yasegata'
        when weight*10000/height/height < 25
            then 'Tekisei'
        else 'Himan'
        end 
    ) as doai
    from kenkosindantb A join shachikuhyo B on A.shachiku_id=B.shachiku_id
    where id=A.shachiku_id;
end
//
delimiter ;
```

```shell-session
mysql> source 3.sql
Database changed
Query OK, 0 rows affected (0.00 sec)

mysql> call show3('a001');
+-------------+---------------+----------+
| shachiku_id | shachiku_name | doai     |
+-------------+---------------+----------+
| a001        | Ai            | Yasegata |
+-------------+---------------+----------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.01 sec)
```

## 4. sumを使ったプロシージャ

```sql:
/* 4.sql */
use sampledb;
delimiter //
create procedure show4()
begin
    select
    A.shachiku_id,
    sum(B.uriage) as torihikigaku
    from shachikuhyo as A
    join torihiki as B on A.shachiku_id=B.tantou
    group by A.shachiku_id
    ;
end
//
delimiter ;
```


```shell-session
mysql> source 4.sql
Database changed
Query OK, 0 rows affected (0.00 sec)

mysql> call show4();
+-------------+--------------+
| shachiku_id | torihikigaku |
+-------------+--------------+
| a001        |          700 |
| a002        |          300 |
| a003        |          300 |
| a004        |          300 |
| a005        |          500 |
| a006        |          600 |
| a009        |          900 |
+-------------+--------------+
7 rows in set (0.00 sec)

Query OK, 0 rows affected (0.03 sec)
```

```sql:4_2.sql
/* 4_2.sql */
use sampledb;
delimiter //
create procedure show4_2()
begin
    select
    A.shachiku_id,
    sum(B.uriage) as torihikigaku
    from shachikuhyo as A
    left outer join torihiki as B on A.shachiku_id=B.tantou
    group by A.shachiku_id
    ;
end
//
delimiter ;
```

```shell-session
mysql> source 4_2.sql
Database changed
Query OK, 0 rows affected (0.00 sec)

mysql> call show4_2();
+-------------+--------------+
| shachiku_id | torihikigaku |
+-------------+--------------+
| a001        |          700 |
| a002        |          300 |
| a003        |          300 |
| a004        |          300 |
| a005        |          500 |
| a006        |          600 |
| a007        |         NULL |
| a008        |         NULL |
| a009        |          900 |
+-------------+--------------+
9 rows in set (0.00 sec)

Query OK, 0 rows affected (0.02 sec)
```


