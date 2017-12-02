# MySQL

<a href="https://qiita.com/pollenjp/items/477cc0e48d98769b7637">MySQL������������</a>

## �ړI
- csv�t�@�C������f�[�^����荞��
    - �f�[�^�x�[�Xsampledb���쐬����
    - 4�̃e�[�u��shachikuhyo, branchtb, torihiki, kenkosindantb��csv�t�@�C�������荞��
- procedure�i�X�g�A�h�v���V�[�W���j�̊�{����
    1. BMI�����߂�v���V�[�W�������
    2. BMI����Ɂu�₹�^�E�K���E�얞�v�ɕ��ނ���v���V�[�W�������
- ���K�����˂�
    3. BMI�ƂƂ���shachiku_id���ꗗ�\��
    4. sum���g�����v���V�[�W��


# csv�t�@�C������f�[�^����荞��

## �f�[�^�x�[�Xsampledb���쐬����

```shell-session
mysql> create database sampledb;
```

## 4�̃e�[�u��shachikuhyo, branchtb, torihiki, kenkosindan��csv�t�@�C�������荞��

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

�ȉ��ł�csv�t�@�C�����e�[�u���Ɋi�[���Ă���B
shachikuhyo.csv�t�@�C�� ==>     shachikuhyo
branch.csv�t�@�C��      ==>     branchtb
torihiki.csv�t�@�C��    ==>     torihiki
kenkosinan.csv�t�@�C��  ==>     kenkosindantb

```shell-session
mysql> load data infile 'shachikuhyo.csv'   into table shachikuhyo      fields terminated by ',' lines terminated by x'0D0A'
mysql> load data infile 'branch.csv'        into table branchtb         fields terminated by ',' lines terminated by x'0D0A'
mysql> load data infile 'torihiki.csv'      into table torihiki         fields terminated by ',' lines terminated by x'0D0A'
mysql> load data infile 'kenkosindan.csv'   into table kenkosindantb    fields terminated by ',' lines terminated by x'0D0A'
```
����ɂ��f�[�^�͊i�[�ł���

# procedure�i�X�g�A�h�v���V�[�W���j�̊�{����
## 1. BMI�����߂�v���V�[�W�������

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

## 2. BMI����Ɂu�₹�^�E�K���E�얞�v�ɕ��ނ���v���V�[�W�������

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


# ���K�����˂�
## 3. BMI�ƂƂ���shachiku_id���ꗗ�\��

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

## 4. sum���g�����v���V�[�W��

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


