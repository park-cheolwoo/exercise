-- sysdate : 현재 시간, dual : 임시DB(출력 후 사라짐)
select sysdate from dual;

-- abs 절대값
select -10 val,abs(-10) as abs from dual;

-- floor 소수점 이하 버림
select 3.141592 ,floor(3.141592) from dual;
-- trunc : 버림, 자리수 지정
select 34.5678,trunc(34.5678,2) from dual;
-- ceil 소수점 이하 올림
select 3.14592, ceil(3.141592) from dual;
-- round 반올림, 자리수 범위지정
-- 소수점 첫째자리
select 34.5678, round(34.5678) from dual;
-- 소수점 둘째자리까지 출력, 셋째자리에서 반올림 됨.
select 34.5678, round(34.5678,2) from dual;
-- 양수 첫째자리에서 반올림, 소수점자리수에서 앞쪽으로 한칸위치 반올림.
select 34.5678, round(35.5678,-1) from dual;
-- mod : 나머지
select 27/2,mod(27,2) from dual;
select 30/3, mod(31,7) from dual;

-- months_between :  두 일자 가운데 지나간 달수를 알려줌
select hire_date,sysdate,round(months_between(sysdate,hire_date)) 달수,round(sysdate-hire_date) 일수 from employees;
-- add_months 3개월 추가
select hire_date,add_months(hire_date,3) from employees;
-- next_day : 다음주 수요일 날짜를 알려줌.
select sysdate,next_day(sysdate,'수요일') from dual;
-- last_date : 그달의 마지막 날짜를 알려줌
select hire_date, last_day(hire_date) from employees;


-- 형변환 함수
select sysdate from dual;
-- 날짜형 > 문자형 변환
select to_char(sysdate,'yyyy/mm/dd hh24:mi:ss') from dual;
select hire_date from employees;
select hire_date,to_char(hire_date,'yyyy-mm-dd') from employees;
-- 문자형 > 날짜형 > 문자형 변환
select to_char(to_date('24/01/01'),'yyyy/mm/dd hh24:mi:ss') from dual;
select to_char('24/01/01','yyyy-mm-dd') from dual;


--extract 함수 : 년,월,일,시,분,초 만 분리해서 가져오는 함수
select sysdate from dual;
select extract(year from sysdate) from dual;
select extract(month from sysdate)from dual;
select extract(day from sysdate) from dual;

-- 숫자타입 -> 문자타입으로 변경해서 포맷, 천단위(,) 표시
-- 9 : 0을 채우지 않음, 0 : 0을 채움
-- L : 국가 통화기호 표시, $ : 달러 표시
select to_char(salary*1382.86*12,'L000,999,999') from employees;
select to_char(123456, '0000000000'),to_char(123456,'999,999,999') from dual;

-- 숫자형 타입은 숫자 앞에 0이 있어도 표시가 되지 않음 : str 타입만 가능
-- 천단위 표시(,)는 숫자형 타입에 입력이 안됨 : 문자형 타입만 가능
insert into chartable2 values(
4,4000000,4000000,04000000
);

-- 숫자형 타입과 문자형(숫자) 타입은 사칙연산 가능 = 두 타입 결과값 출력
select kor+kor_char from chartable;
-- 숫자형 타입과 문자 천단위 표시 숫자타입은 사칙연산 불가능
select kor+kor_char+kor_mark from chartable;