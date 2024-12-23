-- 그룹함수
-- 수학함수 : abs,ceil,floor,round,trunc,mod,power,sqrt
-- 그룹 함수 : sum(합계), avg(평균), count(개수), min(최소), max(최대), median(중간값)
select to_char(sum(salary)) from employees;
select avg(salary) from employees;
-- 소숫점 둘째자리 반올림
select round(avg(salary),2) from employees;
-- 버림
select trunc(avg(salary),2) from employees;
select max(salary) from employees;
select min(salary) from employees;

-- group by : 단일함수를 출력하고 싶을 때, 단일함수를 입력하면 됨.
-- 단일함수와 그룹함수를 함께 사용하려면 group by로 지정해야함.
select department_id,max(salary) from employees group by department_id;


-- 단일함수 >> 그룹함수
select count(*) no,a.department_id dept,department_name deptname
from employees a,departments b
where a.department_id = b.department_id and a.department_id = 50
group by a.department_id, department_name;

-- where 에는 그룹 함수를 쓸 수 없음 => having : 그룹함수 비교연산자
select department_id, avg(salary),count(*) from employees group by department_id having avg(salary)>=7000 ;

-- 순위를 rank컬럼에 추가(★)
update stu a set rank = (
select ranks from (
select no,rank() over (order by total desc) as ranks from stu
) b 
where b.no = a.no);
