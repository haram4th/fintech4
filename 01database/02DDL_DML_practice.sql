-- DDL을 이용해서 DB만들고 테이블 만들기/삭제하기
-- Create database/schema 데이터베이스 이름;
create database sampledb2;
create database if not exists sampledb2;

-- 데이터베이스 목록 확인 show databases;
show databases;

-- 데이터베이스 열기/사용 use 데이터베이스명;
use sampledb2;

-- 데이터베이스 지우기 drop database 데이터베이스명;
drop database sampledb2;
drop database if exists sampledb2;

-- sampledb2 다시 만들기
create database if not exists sampledb2;

-- 테이블 만들기 create table if not exists 테이블명 
-- (컬럼이름1 데이터타입 제약조건(not null, null, unique),
--   컬럼이름2 데이터타입 제약조건(not null, null, unique))

use sampledb2;
-- businesscard 테이블 만들기
create table businesscard (
	name varchar(255) not null,
    address varchar(255) not null,
    telephone varchar(15) null);
    
-- 테이블 목록 조회 show tables;
show tables;

-- 테이블의 속성, 제약조건 보기 desc 테이블명;
desc businesscard;

-- 이미 만들어진 테이블의 속성 변경하기 alter
-- name 컬럼을 not null에서 null로 변경
alter table businesscard modify name varchar(100) null;
desc businesscard;
-- DDL  create(만들기), alter(수정하기), drop(삭제하기), truncate(비우기)
 
-- 만들어진 테이블에 데이터 입력하기 DML insert, update, delete
-- 데이터 입력하기 insert into 테이블명 (컬럼명1, 컬럼명2) values (자료1, 자료2)
insert into businesscard (`name`, `address`, `telephone`)
values ('bob','서초동 123', '02-1234-5678'),
('sam','서초동 124', '02-1234-5679'),
('bob2','서초동 125', '02-1234-5680');

-- select로 입력된 자료 조회
select * from businesscard;

-- insert into시 컬럼명 생략하고 자료만 넣기 
-- 반드시 컬럼수와 자료 수가 일치, 컬럼명 순서대로 입력해야 함
desc businesscard;
insert into businesscard (`name`, `address`, `telephone`)
values ('bob','서초동 123', '02-1234-5678'),
('sam','서초동 124', '02-1234-5679'),
('bob2','서초동 125', '02-1234-5680');

insert into businesscard (`address`)
values ('서초동 126');
select * from businesscard;

insert into businesscard (`name`, `telephone`)
values ('bob', '02-1234-5678');

insert into businesscard values ('bob3','서초동 127', '02-1234-5681');


insert into businesscard 
(`address`, `name`, `telephone`)
values ('서초동 129', 'bob5', '02-1234-5683');

-- no 컬럼 추가 int null
alter table businesscard add column no int null;

desc businesscard;
select * from businesscard;


insert into businesscard values ('bob3','서초동 127', 8,'02-1234-5681');

insert into businesscard 
(`address`, `name`, `no`, `telephone`)
values ('서초동 130', 'bob6', 8, '02-1234-5684');

-- Primary key  Autoincrement 적용하기 
alter table businesscard add column idx int not null auto_increment primary key;
desc businesscard;

select * from businesscard;

insert into businesscard 
(`address`, `name`, `no`, `telephone`)
values ('서초동 131', 'bob7', 9, '02-1234-5685');

-- auto_increment가 설정된 컬럼이 있는 경우 반드시 컬럼명을 명시해 주어야 한다.
insert into businesscard 
values ('bob8', '서초동 132', 10, '02-1234-5685');

-- ----------------------------------------------------------
-- 기존 테이블의 자료를 수정하기 update (where 조건을 반드시 주어야 한다.)
-- update 테이블명 set 컬럼1 = 값1, 컬럼2 = 값2 where 조건;
select * from businesscard;
update businesscard set name = 'bob4', address ='서초동 128' where idx = 6;
commit;
update businesscard set no = 1;

-- 데이터 삭제하기 delete
delete from businesscard where idx = 4;
delete from businesscard;

-- --------------------------------------------------------------
-- 트랜젝션 여러 dml을 한 묶음 으로 처리, 중간에 문제가 생기면 
-- rollback으로 되돌리고 문제가 없으면 commit으로 확정 
-- autocommit 확인/전환 1=on, 0=off
select @@autocommit;
set autocommit = 0;
select @@autocommit;
start transaction;
select * from businesscard;
update businesscard set name='sam2', telephone="02-1111-2222" where idx = 16;
commit;
rollback; -- DML 명령에서만 rollback 가능 DDL create, drop, truncate 롤백 불가
set autocommit = 1;
select @@autocommit;