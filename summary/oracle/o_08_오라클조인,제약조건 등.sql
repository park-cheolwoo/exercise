-- 조인(join)
select employee_id,emp_name,email,salary,employees.department_id,department_name 
from employees,departments
where employees.department_id = departments.department_id
;

-- foreign key로 등록이 되면, primary key를 삭제할 때 foreign key에 데이터가 있으면 삭제가 안됨.
-- (on delete cascade)primary key가 삭제가 되면 foreign key로 등록된 모든 글을 삭제시킴
alter table board add constraint id_fk foreign key(id) references bmember(id) on delete cascade;
alter table board drop constraint id_fk;


alter table board add constraint fk_board_id foreign key(id) references bmember(id) on update cascade;

-- 테이블 create할때, foreign key 생성
create table board2(
bno number(4) primary key,
btitle varchar2(1000) not null,
id varchar2(30),
bcontent clob,
constraint fk_board2_id foreign key(id) references bmember(id)
);
-- on delete cascade
-- 부모데이터 삭제시 자식 데이터 모두 삭제
-- on delete set null
-- 부모데이터 삭제시 자식 데이터 모두 null
-- 기본값
-- 자식데이터가 있을 경우, 부모데이터가 삭제가 되지 않음.

-- check 구문 (check의 범위를 벗어나면 에러)
-- default 구문 (값이 없으면 default)
create table emp01(
empno number(4) primary key,
ename varchar2(30) default '무명',
salary number(7,2) check(salary between 2000 and 20000),
gender varchar2(10) check(gender in('Male','Female'))
);

-- 부서번호, 부서명 조인
select a.department_id,department_name 
from employees a,departments b
where a.department_id = b.department_id;

-- 1: 100, 2: 1000, 3:5000, 4:10000, 5:20000포인트
-- point 
select id,lavel,decode(lavel,1,100,2,1000,3,5000,4,10000,5,20000)|| 'point' as point from lavel_data;

-- decode는 일치하는 경우에만 사용가능
-- case : decode와 같지만 비교연산자를 사용할 수 있음
select id,pw,name,deptno, case when deptno =10 then '총무부'
when deptno=20 then '인사부'
when deptno=30 then '마케팅'
end as deptName from mem;

-- 1. cross join : 특별한 키워드 없이 두개의 테이블을 검색하는 것
select * from employees; -- 107
select * from departments; -- 27
select count(*) from employees,departments; -- 107*27 = 2889
-- 2. inner join (equi join, non-equi join)
-- inner join : equi join : 같은 컬럼을 가지고 비교해서 두개의 테이블을 검색
select emp_name,a.department_id,department_name from employees a,departments b where a.department_id=b.department_id; -- 50
select bno,btitle,bcontent,email,phone,bgroup,bstep,bindent,bhit,bdate,bfile from member a,board b where a.id = b.id;
-- no-equi join : 두 테이블간 같은 컬럼이 없으면서 두 테이블의 값을 비교해서 출력
select emp_name,salary,grade from employees a,salgrade b
where salary between losal and hisal;
-- 3. self join : 자신의 테이블 2개를 join해서 결과값을 출력
select employee_id,emp_name,manager_id from employees;
select employee_id, emp_name from employees where employee_id=124;

select a.employee_id,a.emp_name,a.manager_id,b.emp_name 
from employees a, employees b
where a.manager_id = b.employee_id;
-- 4. outer-join : 해당 컬럼에 null값이 존재할 시 null값을 포함해서 출력
select a.employee_id,a.emp_name,a.manager_id,b.emp_name,a.salary
from employees a, employees b
where a.manager_id = b.employee_id(+);



-- 5-1.ansi cross join
select * from employees cross join departments;
-- 5-2. ansi inner join
select a.department_id, department_name
from employees a inner join departments b
on a.department_id = b.department_id;
-- 5-3. ansi equi join
select a.department_id,department_name from employees a,departments b
where a.department_id = b.department_id;
-- 5-4. ansi join(using)
select department_id, department_name
from employees inner join departments
using (department_id);
-- 5-5. ansi join : natural join
select department_id,department_name 
from employees a natural join departments b;

-- union : 같은 테이블, 다른 테이블 모두 사용가능, 컬럼의 타입만 맞으면 모두 출력
-- 조건1 : 위쪽 쿼리문과 아래쪽 쿼리문 개수 동일
-- 조건2 : 타입이 일치
select employee_id, emp_name from  employees
union
select no,name from students;

-- rownum : 번호를 새롭게 부여
select rownum,bno,btitle,bdate from board2 order by bdate desc,btitle asc;
-- row_number() over() : 정렬한 후 번호를 부여
select rnum,bno,btitle,bdate from(
select row_number() over(order by bdate desc) rnum,bno,btitle,bdate from board2)
where rnum between 11 and 20;





-- view 생성 create
create or replace view employees_view
as
select employee_id,emp_name,email,phone_number,hire_date from employees;
-- view 삭제 drop
drop view emp_view;
-- view 컬럼 커멘트(주석-설명문) 추가
comment on column employees_view.employee_id is '사원번호에 해당 됩니다.';
-- 컬럼 커멘트 주석 확인
select * from user_col_comments;
-- 테이블 커멘트 주석 확인
select * from user_table_comments;
-- with read only : select만 가능, insert,update,delete 불가
create or replace view emp02_view
as
select employee_id, emp_name,hire_date from emp02
with read only;
- 단순 view : 1개 테이블루 구성된 것
-- insert,update,delete 가능, not null 제약조건이 되어 있으면 insert 불가할 수도 있음
-- 복합 view : 2개 이상의 테이블 조인, 함수 사용, group by절 같은 경우는 insert,update,delete 불가
