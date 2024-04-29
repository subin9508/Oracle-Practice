/*
 * 연습문제:
 * https://github.com/JakeOh/202403_itwill_java152_lab_java/blob/master/lab_sql/hr.sql
 * 파일을 다운받고 스크립트 전체 실행.
 * countries, departments, employees, jobs, locations, regions 테이블 사용.
*/

-- 1. 직원의 last_name과 부서 이름을 검색. (inner join)
 select employees.last_name, departments.department_name
 from employees
        join departments on employees.department_id = departments.department_id;
  
-- 2. 직원의 last_name과 부서 이름을 검색. 부서 번호가 없는 직원도 출력. (left outer join)
  select employees.last_name, departments.department_name
  from employees
        left outer join departments on employees.department_id = departments.department_id;
    
    
-- 3. 직원의 last_name과 직무 이름(job title)을 검색.
 select employees.last_name, jobs.job_title
 from employees
       inner join jobs on employees.job_id = jobs.job_id;
    
-- 4. 직원의 last_name과 직원이 근무하는 도시 이름(city)를 검색.
 select employees.last_name, locations.city
 from employees
 inner join departments on employees.department_id = departments.department_id
 inner join locations on departments.location_id = locations.location_id;
 
-- 5. 직원의 last_name과 직원이 근무하는 도시 이름(city)를 검색. 근무 도시를 알 수 없는 직원도 출력.
 select employees.last_name, locations.city
 from employees
 left outer join departments on employees.department_id = departments.department_id
 left outer join locations on departments.location_id = locations.location_id;


-- 6. 2008년에 입사한 직원들의 last_name을 검색.
 select last_name from employees
 where to_char(hire_date, 'YYYY') = '2008';
 
-- YY는 무조건 현재 세기 기준으로 계산, RR은 상식적인 기준으로 연도 계산.

-- 7. 2008년에 입사한 직원들의 부서 이름과 부서별 인원수 검색.
 select department_name, count(*) as "인원 수"
 from departments 
        join employees on departments.department_id = employees.department_id 
 where to_char(hire_date, 'YYYY') = '2008'
 group by department_name;

-- 8. 2008년에 입사한 직원들의 부서 이름과 부서별 인원수 검색. 
--    단, 부서별 인원수가 5명 이상인 경우만 출력.
 select department_name, count(*) as "인원 수"
 from departments 
        join employees on departments.department_id = employees.department_id 
 where to_char(hire_date, 'YYYY') = '2008'
 group by department_name
 having count(*) >= 5;

 
-- 9. 부서번호, 부서별 급여 평균을 검색. 소숫점 한자리까지 반올림 출력.
 select department_id, round(avg(salary), 1)
 from employees
 group by department_id
 order by department_id;

-- 10. 부서별 급여 평균이 최대인 부서의 부서번호, 급여 평균을 검색. **
 select department_id, round(avg(salary), 1)
 from employees
 group by department_id
 having avg(salary) = (
            select max(avg(salary)) from employees group by department_id);
            
-- (2) 다른 코드. 다중행 서브쿼리 사용.
select department_id, round(avg(salary), 1)
from employees
group by department_id
having avg(salary) >= ALL (
    select avg(salary) from employees
    group by department_id);
 

-- 11. 사번, 직원이름, 국가이름, 급여 검색.
 select employee_id, first_name, country_name, salary
 from locations
 inner join countries on locations.country_id = countries.country_id
 inner join departments on locations.location_id = departments.location_id
 inner join employees on departments.department_id = employees.department_id;

-- 12. 국가이름, 국가별 급여 합계 검색
 select country_name, sum(salary)
 from countries
 join locations on countries.country_id = locations.country_id
 join departments on locations.location_id = departments.location_id
 join employees on departments.department_id = employees.department_id
 group by country_name;

-- 13. 사번, 직원이름, 직무 이름, 급여를 검색.
 select employee_id, first_name, job_title, salary
 from employees
 inner join jobs on employees.job_id = jobs.job_id;
 
    
-- 14. 직무 이름, 직무별 급여 평균, 최솟값, 최댓값 검색.
 select job_title, avg(salary), min_salary, max_salary
 from jobs
 inner join employees on jobs.job_id = employees.job_id
 group by employees.job_id, job_title, min_salary, max_salary;

-- 15. 국가 이름, 직무 이름, 국가별 직무별 급여 평균 검색.
 select country_name, job_title, avg(salary)
 from countries
 inner join locations on countries.country_id = locations.country_id
 inner join departments on locations.location_id = departments.location_id
 inner join employees on departments.department_id = employees.department_id
 inner join jobs on employees.job_id = jobs.job_id
 group by country_name, job_title
 order by country_name;

-- 16. 국가 이름, 직무 이름, 국가별 직무별 급여 합계을 출력.
--     미국에서, 국가별 직무별 급여 합계가 50,000 이상인 레코드만 출력.
 select country_name, job_title, sum(salary)
 from countries
 inner join locations on countries.country_id = locations.country_id
 inner join departments on locations.location_id = departments.location_id
 inner join employees on departments.department_id = employees.department_id
 inner join jobs on employees.job_id = jobs.job_id
 group by country_name, job_title
 having country_name = 'United States of America' and sum(salary) >= 50000
 order by country_name;