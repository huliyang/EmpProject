DROP TABLE IF EXISTS admin ;
DROP TABLE IF EXISTS dept;
DROP TABLE IF EXISTS emp;

CREATE TABLE admin(
	aid 		VARCHAR(32)		PRIMARY KEY,
	password 	VARCHAR(32)
);

CREATE TABLE dept(
    deptno      NUMERIC(2,0)    PRIMARY KEY COMMENT '部门编号',
    dname       VARCHAR(14) COMMENT '部门名称',
    loc         VARCHAR(13) COMMENT '部门位置'
);

CREATE TABLE emp
(
   empno                numeric(4,0) primary key not null comment '雇员编号',
   ename                varchar(10) comment '雇员姓名',
   job                  varchar(9) comment '雇员职位',
   mgr                  numeric(4,0) comment '雇员领导',
   hiredate             date comment '雇佣日期',
   sal                  numeric(7,2) comment '工资',
   comm                 numeric(7,2) comment '佣金',
   deptno               numeric(2,0),
   constraint FK_DEPTNO foreign key (deptno) references DEPT(deptno) on delete restrict on update restrict
)engine=innodb default charset=utf8;

CREATE TABLE salgrade
(
	grade 				int,
	losal 				int,
	hisal	 			int
);

CREATE TABLE bonus(
	ename 				varchar(10),
	job 				varchar(9),
	sal 				int,
	comm 				int
);
INSERT INTO admin(aid,password) VALUES("admin","admin");

ALTER TABLE emp ADD photo VARCHAR(100) DEFAULT 'nophoto.jpg';
ALTER TABLE emp ADD note text;
ALTER TABLE emp DROP COLUMN photo;
