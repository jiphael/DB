-- �й�ã��
SELECT student_id
FROM student_info
WHERE student_id = 'id1';

-- ������ ����
SELECT s.student_id
    , d.department_id
    , s.student_name
    , s.student_email
FROM student_info s JOIN department_info d ON(s.department_id = d.department_id)
WHERE student_id = 'id1';