-- 컬럼 타입 변경 -> 컬럼안 데이터가 null이면 가능
-- 다른 타입인 경우 데이터를 null로 변경한 후 타입을 변경해야 함.
modify email number(6);
-- 컬럼안에 데이터가 있다면 제약조건, 65 길이의 문자가 있을 경우, 50으로 변경안됨
alter table emp4
modify(email varchar2(50));


-- 문자형타입을 숫자형 타입에 복사
-- 안에 있는 데이터가 모두 숫자형이기에 가능
-- 문자가 포함되어 있으면 타입변경이 불가
update emp4 set manager_id = phone_number;
-- 속성 변경가능
alter table emp4 modify hire_date date null;
alter table emp4 modify hire_date date not null;

-- 컬럼 삭제
drop column hire_date2;

-- primary key : 중복불가, null값 불가
-- unique : 중복불가, null값 허용
-- not null : 중복가능, null값 불가
-- default : 값이 입력되지 않았을때 디폴트값 지정

-- primary key 추가, 수정
-- constraint id_pk : 이름설정
alter table member add constraint id_pk primary key (id);

-- primary key 삭제
alter table member drop constraint id_pk;

-- foreign key로 등록이 되면, primary key를 삭제할 때 foreign key에 데이터가 있으면 삭제가 안됨.
-- (on delete cascade)primary key가 삭제가 되면 foreign key로 등록된 모든 글을 삭제시킴
alter table board add constraint id_fk foreign key(id) references bmember(id) on delete cascade;
alter table board drop constraint id_fk;