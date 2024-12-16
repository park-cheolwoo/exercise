-- 주석 : --

-- create 테이블 생성
create table member(
no number(4),
id varchar2(20),
pw varchar2(20),
name varchar2(20),
phone varchar2(20),
mdate date
);

-- insert 데이터 입력
insert into member values(
1,'aaa','1111','홍길동','111-1111-1111','2024-10-29'
);

-- select 데이터 검색
select * from member;

-- delete 데이터 삭제
--delete member where no='2'; 

--update 데이터 수정
update member set name='홍길자' where no=1;

-- drop 테이블 삭제
--drop table students;

-- 커밋
commit;

-- 테이블 구조
desc employees;

-- alter변경 member테이블 no컬럼의 타입길이를 변경
alter table member modify no number(10);
-- alter 컬럼의 이름을 변경
alter table member rename column no to memberNo;
-- alter 데이터타입 변경
alter table member modify no varchar2(10);
-- alter 데이터타입을 변경하기 위해서는 해당 컬럼의 값이 모두 null이어야함



-- 테이블을 생성하면서 테이블 내용을 모두 복사
create table emp2 as select * from employees;

-- 테이블을 생성하면서 테이블 구조만 복사
create table emp3 as select * from employees where 1=2;
select * from emp2;
select count(*) from emp2;
select count(*) from employees;

-- 테이블이 존재할 경우 데이터만 복사
create table member2 as select * from member where 1=2;
select * from member;
select * from member2;
insert into member2 select * from member;
select * from member2;


-- null값 검색 is null
select * from stu where name is null;

-- nvl() 함수, nvl(kor,0) : kor 컬럼에 null값이 있으면 0으로 표시
select no,name,kor,nvl(kor,0)+100 from stu;

-- 컬럼명 별칭 사용 : as "" 특수문자+사이공간까지 컬럼명으로 사용 가능
select salary,salary*12,salary*12+(salary*12*nvl(commission_pct,0)/100) as "r e a l salary" from employees;

-- 중복제거 : distinct
select department_id from employees;
-- 정렬 : order by - 순차정렬 : (asc) 생략가능 - 역순정렬 : desc
select distinct department_id from employees order by department_id asc;

-- 문자열 자르기 : substr(start,length) //cf) substring(start,end) 는 안됨.

-- where절 : 조건비교연산자 >,<,>=,<=,=,!=
select * from employees where manager_id = 124;
select * from employees where job_id = 'SH_CLERK';

-- null값은 count()에 포함되지 않음  
select count(*) from employees; -- 107
select count(employee_id) from employees; -- 107
select count(department_id) from employees; -- 106, null값이 1개 있기에 106개가 나옴


-- 숫자,날짜인 경우 비교연산자 가능
select emp_name,hire_date from employees where hire_date >= '2002/01/01';

-- in : 비교할 리스트 설정
select commission_pct from employees where commission_pct in (0.2,0.3,0.5);

-- between - and : <= 포함이 되어 있는 경우만 해당
select * from employees where employee_id between 150 and 170;

-- like 연산자 : 포함되어 있는 글자 검색
select * from employees where job_id like '%MAN'; -- MAN으로 끝나는 단어를 검색
select * from employees where job_id like 'ST%'; -- ST로 시작되는 단어를 검색
-- 2번째 자리에 t 가 들어가 있는 이름 출력
select * from employees where emp_name like '_a%';