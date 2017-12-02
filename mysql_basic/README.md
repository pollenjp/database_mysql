# MySQL����������������

## �ڕW
- �t�@�C���ɏ����ꂽMySQL �R�}���h�����s
- �f�[�^�̍쐬
    - create_data_shachiku.sql
    - create_data_branchtb.sql
    - create_data_torihiki.sql
- �ȉ��̑�������s����
    1. shachikuhyo��shachiku_id��shachiku_name��2017�N�����ɂ�����N����ꗗ�\��
    2. shachiku_name��"i"�ŏI���branch_id��1��shachikuhyo�̋L�^���ꗗ�\��
    3. birthyear��1980�ȉ��܂���1995�ȏ��shachikuhyo��shachiku_id��name��\��
    4. shachikuhyo��branchtb������
    5. branch_name ��"A"�Ŏn�܂�x�X�ɏ�������В{���̈ꗗ��\��
    6. shachiku_name�i�В{���j���Ƃɑ������\��
    7. branch_name(�x�X���j���Ƃɑ������\�� 


## �t�@�C���ɏ����ꂽMySQL �R�}���h�����s
<a href="https://dev.mysql.com/doc/refman/5.6/ja/mysql-batch-commands.html">MySQL5.6(����)</a>

��F���[�g������MySQL�𑀍삷��ꍇ


```shell-session
mysql -u root -p < text_file.sql
```



```sql:text_file.sql
use db_name;
...
...
...
```


## �f�[�^�̍쐬

```mysql:create_data_shachiku.sql
CREATE DATABASE sampledb;   /* �f�[�^�x�[�X�쐬 */
SHOW DATABASES;             /* �f�[�^�x�[�X�̈ꗗ�\�� */
USE sampledb;               /* sampledb ���w�� */
CREATE table shachikuhyo(   /* �e�[�u���̍쐬 */
    shachiku_id CHAR(4) PRIMARY KEY,
    shachiku_name CHAR(15),
    birth_year INT(4),
    branch_id CHAR(3)
);
SHOW tables;                /* �e�[�u���̊m�F */
DESC shachikuhyo;           /* �e�[�u��shachikuhyo ��\�� */

INSERT INTO shachikuhyo(    /* �f�[�^�̓��� */
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
SELECT * FROM shachikuhyo;  /* �f�[�^�̊m�F */
```


```shell-session
# ���s����
mysql> source create_data_shachikuhyo.sql
ERROR 1007 (HY000): Can't create database 'sampledb'; database exists # ���ɍ���Ă���Ƃ��̃G���[���o��
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
SHOW DATABASES;             /* �f�[�^�x�[�X�̈ꗗ�\�� */
USE sampledb;               /* sampledb ���w�� */
CREATE table branchtb(      /* �e�[�u���̍쐬 */
    branch_id CHAR(3) PRIMARY KEY,
    branch_name CHAR(10),
    jusho CHAR(30)
);
SHOW tables;                /* �e�[�u���̊m�F */
DESC branchtb;              /* �e�[�u��branchtb ��\�� */
/*DESCRIBE branchtb;          /* ����ł��\ /* */

INSERT INTO branchtb(       /* �f�[�^�̓��� */
    branch_id,
    branch_name,
    jusho
)
VALUES
('1',   'AAAA', 'TokyotoDDDD'),
('2',   'BBBB', 'TokyotoEEEE'),
('3',   'CCCC', 'TokyotoFFFF')
;
SELECT * FROM branchtb;  /* �f�[�^�̊m�F */
```

```shell-session
# ���s����
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
SHOW DATABASES;             /* �f�[�^�x�[�X�̈ꗗ�\�� */
USE sampledb;               /* sampledb ���w�� */
CREATE table torihiki(   /* �e�[�u���̍쐬 */
    torihiki_id CHAR(4) PRIMARY KEY,
    uriage CHAR(4),
    tantou CHAR(4)
);
SHOW tables;                /* �e�[�u���̊m�F */
DESC torihiki;           /* �e�[�u��torihiki ��\�� */

INSERT INTO torihiki(    /* �f�[�^�̓��� */
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
SELECT * FROM torihiki;  /* �f�[�^�̊m�F */
```

```shell-session
# ���s����
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


## shachikuhyo��branch_id��shachikuhyo�̋L�^���ꗗ�\������B


```sql:1.sql
/* 1.sql */
/* shachikuhyo��shachiku_id��shachiku_name��2017�N�����ɂ�����N����ꗗ�\�� */
use sampledb;
select shachiku_id, shachiku_name, (2017-birthyear) from shachikuhyo;
```

```shell-session
/* ���s���� */
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

## shachiku_name��"i"�ŏI���branch_id��1��shachikuhyo�̋L�^���ꗗ�\��

```sql:2.sql
/* 2.sql */
/* 2. shachiku_name��"i"�ŏI���branch_id��1��shachikuhyo�̋L�^���ꗗ�\�� */
use sampledb;                       /* �f�[�^�x�[�Xsampledb���w�� */
select * from shachikuhyo
    where shachiku_name like "%i"   /* �Ō�̕�����i�ł������ */
        and branch_id=1;
```

```shell-session
# ���s���� 
mysql> source 2.sql
Database changed
+-------------+---------------+------------+-----------+
| shachiku_id | shachiku_name | birth_year | branch_id |
+-------------+---------------+------------+-----------+
| a001        | Ai            |       1995 | 1         |
+-------------+---------------+------------+-----------+
1 row in set (0.00 sec)
```

## birthyear��1980�ȉ��܂���1995�ȏ��shachikuhyo��shachiku_id��name��\��

```sql:3.sql
/* 3.sql */
/* 3. birth_year��1980�ȉ��܂���1995�ȏ��shachikuhyo��shachiku_id��name��\�� */
use sampledb;
select shachiku_id, shachiku_name from shachikuhyo A
where A.birth_year <= 1980 or A.birth_year >= 1995;
```

```shell-session
# ���s����
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

## 4. shachikuhyo��branchtb������

```sql:4.sql
/* 4.sql */
/* shachikuhyo��branchtb������ */
use sampledb;
select * from shachikuhyo 
join branchtb 
on shachikuhyo.branch_id = branchtb.branch_id;
```


```shell-session
# ���s����
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

## 5. branch_name ��"A"�Ŏn�܂�x�X�ɏ�������В{���̈ꗗ��\��

```sql:5.sql
/* 5.sql */
/* 5. branch_name ��"A"�Ŏn�܂�x�X�ɏ�������В{���̈ꗗ��\�� */
use sampledb;
select * from shachikuhyo 
join branchtb 
on shachikuhyo.branch_id = branchtb.branch_id
where branch_name like "A%";
```

```shell-session
# ���s����
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

## 6. shachiku_name�i�В{���j���Ƃɑ������\��

```sql:6.sql
/* 6.sql */
/* 6. shachiku_name�i�В{���j���Ƃɑ������\�� */
use sampledb;
select 
    A.shachiku_name,
    sum(B.uriage)
    from shachikuhyo A
    join torihiki B on A.shachiku_id=B.tantou
    group by A.shachiku_name;
```

```shell-session
# ���s����
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

## 7. branch_name(�x�X���j���Ƃɑ������\�� 

```sql:7.sql
/* 7.sql */
/* 7. branch_name(�x�X���j���Ƃɑ������\��  */
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
# ���s����
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

