-- 시퀀스 : 자동으로 번호부여
create sequence stu_seq
start with 1 -- 시작번호
increment by 1 -- 증감량
minvalue 1 -- 최소값
maxvalue 9999 -- 최대값
nocycle -- 최대값 도달시 다시 1부터 시작
nocache; -- 메모리에 시퀀스값 미리 할당
-- 시퀀스에서 번호생성
-- nextval : 다음 번호
select stu_seq.nextval from dual;
-- currval : 현재 번호
select stu_seq.currval from dual;


create table board(
bno number(4),
btitle varchar2(100),
bcontent clob, -- 대용량 글자타입
id varchar2(20),
bgroup number(4), -- 답변달기 그룹핑
bstep number(4),    -- 답변달기 경우 순서정의
bindent number(4),  -- 답변달기 들여쓰기
bhit number(10),      -- 조회수
bdate date                -- 등록일
);

-- 타입
-- 문자형, 숫자형, 날짜형
-- char, varchar2, nchar,nvarchar2,long,clob
-- char,varchar2 : 한글문자 입력시, 3byte 사용
-- varchar2(6) : 한글2글자입력
-- nvarchar2(5) : 한글 5자리까지 입력가능 - 2byte
-- number
-- date - 초까지 입력 , timestamp-밀리세컨드 까지 입력

-- length 문자길이
select length('홍길동') from dual;
-- lengthb : byte크기
select lengthb('홍길동') from dual;


-- 등수함수 rank() over(기준점) 입력, no중복이 없음
select no, rank() over(order by total desc) ranks from students;

-- invisible : 컬럼을 숨김
alter table emp2 modify EMAIL invisible;
-- visible : 컬럼을 나타남
alter table emp2 modify EMAIL visible;
-- drop column : 컬럼 삭제
alter table emp2 drop column email;


-- substr 함수 : 문자에서 시작위치, 가져올 개수
-- 오라클에서는 위치점이 0이 아닌 1부터 시작
select substr(sysdate,0,2) from dual;

-- 문자형 타입에는 숫자형 타입 가능
insert into chartable values(
1,10000,to_char(10000,'00000000'),to_char(10000,'0,000,000'));
insert into chartable values(
1,10000,10000,10000);

-- number형 타입 -> 날짜형 타입
-- 문자형 타입 -> 날짜형 타입
select sysdate-to_date('20241031') from dual;

-- 천단위 문자형 타입 -> 천단위 제외 숫자형 타입
select to_number('20,000','999,999') from dual;

-- 날짜 -> 문자 to_char ## 날짜포맷
-- 문자 -> 날짜 to_date ## 날짜사칙연산
-- 숫자 -> 문자 to_char ## 천단위, 0과9
-- 문자 -> 숫자 to_number ## 천단위 표시 삭제 후 계산


-- 문자,숫자형 타입 -> 날짜형 타입 변경 가능
-- 숫자,날짜형 타입 -> 문자형 타입 변경 가능
-- 문자 -> 숫자형 타입 변경가능
-- 날짜 -> 숫자형 타입 변경불가
-- 날짜 -> 문자 -> 숫자형 타입 변경 가능

-- 문자형 타입을 합쳐서 + 기호를 사용해서 합치려고 하면 에러
select emp_name,email from employees;
select emp_name||email from employees;

-- lower : 소문자 치환, upper : 대문자 치환, initcap : 첫글자 대문자
select * from member where lower(name)='bryan';
--lpad
select 'john',lpad('john',10,'#') from dual;
--rpad
select 'john',rpad('john',10,'#') from dual;
--trim : 앞,뒤공백없애기, ltrim,rtrim
-- 공백도 길이에 포함
select length('    aaa   '),length(trim('    aaa   ')),ltrim('    aaa   '),rtrim('    aaa   ') from dual;
--replace:치환
select '  a b c    ',trim('  a b c    ') from dual;
select '  a b c    ',trim('  a b c    '),length(replace('  a b c    ',' ','')) from dual;

--substr : 특정 위치 자르기 (시작위치,개수)
select 'abcdefg',substr('abcdefg',0,3),substr('abcdefg',3,3) from dual;
-- translate 치환
-- translate : 일대일 대응(한글자씩 해당되는 단어를 각각의 단어로 치환, 순서에 없는 변환글자는 삭제처리)
-- replace : '' 안의 단어가 일치하는 문자만 치환 
select 'axyz',translate('axyz','xy','ab') from dual;
select 'axyz',translate('jxyzxkkcyjccx','xy','ab'),replace('jxyzxkkcyjccx','xy','ab') from dual;
select 'axyz',replace('jxyzxkkcyjccx','xy','ab') from dual;
-- length() : 문자열 길이
-- students 테이블 name 글자 길이가 10자 이상인 학생만 출력
select * from students where length(name) >=10;