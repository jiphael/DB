-- 학번찾기
SELECT student_id
FROM student_info
WHERE student_id = 'id1';

-- 내정보 보기
SELECT student_id
    , department_id
    , student_name
    , student_email
FROM student_info s JOIN department_info d ON(s.department_id = d.department_id)
WHERE student_id = 'id1';