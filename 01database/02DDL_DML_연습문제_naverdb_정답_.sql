create database if not exists naver_db;

show databases;

use naver_db;

create table member (
mem_id char(8) not null primary key,
mem_name varchar(10) not null,
mem_number tinyint not null,
addr char(2) not null,
phone1 char(3) null,
phone2 char(8) null,
height tinyint unsigned null,
debut_date date
);

desc member;

create table buy (
num int not null primary key auto_increment,
mem_id char(8) not null,
prod_name char(6) not null,
group_name char(4) null,
price int unsigned not null,
amount smallint unsigned not null
);

desc buy;
-- ALTER TABLE buy RENAME COLUMN prince TO price;

insert into member 
values
("TWC", "트와이스", 9, "서울", "02", "11111111", 167, "2015-10-19"),
("BLK", "블랙핑크", 4, "경남", "055", "22222222", 163, "2016-08-08"),
("WMN", "여자친구", 6, "경기", "031", "33333333", 166, "2015-01-15"),
("OMY", "오마이걸", 7, "서울", null, null, 160, "2015-04-21"),
("GRL", "소녀시대", 7, "서울", "02", "44444444", 168, "2007-08-02"),
("ITZ", "잇지", 5, "경남", null, null, 167, "2019-02-12"),
("RED", "레드벨벳", 4, "경북", "054", "55555555", 161, "2014-08-01"),
('APN', '에이핑크', 6, '경기', '031', '77777777', 164, '2011-02-10'),
('SPC', '우주소녀', 13, '서울', '02', '88888888', 162, '2016-02-25'),
('MMU', '마마무', 4, '전남', '061', '99999999', 165, '2014-06-19');

INSERT INTO buy (`mem_id`, `prod_name`, `group_name`, `price`, `amount`) VALUES
('BLK', '지갑', NULL, 30, 2),
('BLK', '맥북프로', '디지털', 1000, 1),
('APN', '아이폰', '디지털', 200, 1),
('MMU', '아이폰', '디지털', 200, 5),
('BLK', '청바지', '패션', 50, 3),
('MMU', '에어팟', '디지털', 80, 10),
('GRL', '혼공SQL', '서적', 15, 5),
('APN', '혼공SQL', '서적', 15, 2),
('APN', '청바지', '패션', 50, 1),
('MMU', '지갑', NULL, 30, 1),
('APN', '혼공SQL', '서적', 15, 1),
('MMU', '지갑', NULL, 30, 4);

select * from member;
select * from buy;

-- drop database naver_db;