/*
 * 조건 검색 where
 * 
 * 테이블에서 데이터 검색:
 * (1) projection: 테이블에서 원하는 컬럼(들)을 선택.
 * (2) selection: 테이블에서 조건을 만족하는 행(들)을 검색.
 * 
 * 문법: select 컬럼, ... from 테이블 where 조건식 order by 컬럼, ...; 
 * 조건식에서 사용되는 연산자들: 
 *  (1) 비교 연산자: =(같다), !=(다르다), >, >=, <, <=, is null, is not null, ...
 *  (2) 논리 연산자: and, or, not
 */
 
 -- 직원 테이블에서 10번 부서에서 근무하는 직원들의 부서번호, 사번, 이름 출력.
 -- 사번의 오름차순 정렬하여 출력.
 select deptno, empno, ename from emp where deptno = 10 order by empno asc;
 
 -- 직원 테이블에서 수당(comm)이 null이 아닌 직원들의
 -- 사번, 부서번호, 이름, 급여, 수당을 출력. 사번 오름차순 정렬.
 select empno, deptno, ename, sal, comm from emp where comm is not null 
 order by empno asc;
 --> SQL의 null 여부 비교를 할 때는 =, != 사용하면 안됨!
 --> SQL에서 null 여부를 비교를 할 때는 반드시 is null, is not null을 사용!
 
 -- 직원 테이블에서 급여가 2000 이상인 직원들의 이름, 업무, 급여를 출력. 
 -- 급여 내림차순 정렬.
 select ename, job, sal from emp where sal >= 2000 order by sal desc;
 
 -- 직원 테이블에서 급여가 2000 이상 3000 이하인 직원들의 
 -- 이름, 업무, 급여를 검색. 급여 내림차순 정렬.
 select ename, job, sal from emp where sal >= 2000 and sal <= 3000 order by sal desc;
 -- where 2000 <= sal <= 3000 (X)
 --> 논리연산자로 & 또는 &&를 사용할 수 없음!
 
 select ename, job, sal 
 from emp
 where sal between 2000 and 3000
 order by sal desc;
 
 -- 직원 테이블에서 10번 또는 20번 부서에서 근무하는 직원들의 
 -- 부서번호, 이름, 급여를 검색. 부서번호 오름차순.
 select deptno, ename, sal
 from emp
 where deptno = 10 or deptno = 20
 order by deptno asc;
 --> where deptno = 10 or 20 (X) : true/false로 인식해야 하기 때문에 or 기준으로 양쪽 모두 조건식으로 작성해야 한다. 
 
 select deptno, ename, sal
 from emp
 where deptno in (10, 20) --> 괄호 안에는 값 작성.
 order by deptno asc; 
 
 
 -- (1)번 문제
 select job, ename, sal 
 from emp
 where job = 'CLERK' -- 대/소문자 구별
 order by ename;
 --> SQL에서는 문자열을 비교할 때 =, != 연산자를 사용.
 --> SQL에서 문자열을 작은 따옴표('')를 사용. 대/소문자를 구분.
 
 -- (2)번 문제
 select job, ename, sal
 from emp
 where job = 'CLERK' or job = 'MANAGER'
 order by job, sal;
 --> where job = 'CLERK' or 'MANAGER' (X)
 
 select job, ename, sal
 from emp
 where job in ('CLERK', 'MANAGER')
 order by job, sal;
 
 
 -- (3)번 문제
 select *
 from emp
 where deptno = 20 and job = 'CLERK';
 

-- (4)번 문제
 select empno, ename, job, sal 
 from emp
 where job != 'CLERK' and job != 'ANALYST' and job != 'MANAGER'
 order by empno;
 
 select empno, ename, job, sal 
 from emp
 where job not in ('CLERK', 'ANALYST', 'MANAGER')
 order by empno;
 
-- 숫자 타입 뿐만 아니라, 문자열과 날짜 타입도 대소 비교가 가능.
-- (예) 'a' < 'b', 2024/04/21 < 2024/04/22 

-- '1987/01/01' 이후에 입사한 직원들의 모든 정보(컬럼)를 출력.
-- 정렬 순서: 입사일 오름차순.
select *
from emp
where hiredate > '1987/01/01'
order by hiredate asc;
--> 날짜 타입을 비교할 때, '1987/01/01' 문자열 타입이 날짜 타입으로 변환.

--> 암묵적(자동) 타입 변환:
--> 오라클은 hiredate 컬럼(date 타입)과 문자열 '1987/01/01'의 크기를 비교할 때
--> 날짜 타입을 문자열로 변환한 후 문자열의 크기 비교를 수행함.

select *
from emp
where hiredate > to_date('1987/01/01')
order by hiredate;
--> 명시적 타입 변환:
-- to_date('문자열'): '문자열'을 날짜(date) 타입으로 변환.

-- like 검색: 특정 문자열로 시작하거나, 특정 문자열이 포함된 값을 찾는 검색.
-- 이름이 'A'로 시작하는 직원들의 모든 정보:
select * from emp
where ename like 'A%'; -- %: '문자' 앞 or 뒤에 몇글자가 와도 상관없다는 의미.

-- like 검색에서 사용하는 wildcard:
-- (1) %: 글자 수 제한 없음.
-- (2) _(underscore, 밑줄): 밑줄이 있는 자리에 어떤 문자든지 있어도 된다. (밑줄이 있는 자리에만)

select * from emp
where job like '_LERK';

-- 이름에 'A'가 포함된 직원들의 모든 정보:
select * from emp
where ename like '%A%'; -- 대/소문자 구별

-- 30번 부서에서 근무하고, 업무이름에 'SALES'가 포함되어 있는 직원들의 
-- 사번, 부서번호, 이름, 업무, 급여, 수당을 출력. 정렬은 사번 오름차순.
select empno, deptno, ename, job, sal, comm
from emp
where deptno = 30 and job like '%SALES%'
order by empno asc;


 