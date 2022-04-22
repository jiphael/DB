select * 
FROM CLASS_INFO ci
JOIN CLASS_SCHEDULE_INFO csi ON (ci.CLASS_ID = csi.CLASS_ID)
JOIN CLASS_REQUEST cr ON (ci.CLASS_ID = cr.CLASS_ID)
WHERE cr.STUDENT_ID = 2019552020
;

update subject_info set subject_name = '정보보안' where subject_id = 2010;
update subject_info set subject_name = '인간행동과사회환경' where subject_id = 3002;
update subject_info set subject_name = '자원봉사론' where subject_id = 3003;
update subject_info set subject_name = '사회복지실천기술론' where subject_id = 3004;
update subject_info set subject_name = '정신건강사회복지론' where subject_id = 3007;
update subject_info set subject_name = '사회복지법제' where subject_id = 3011;
update subject_info set subject_name = '사회복지실무실습' where subject_id = 3012;
update subject_info set subject_name = '지역사회복지론' where subject_id = 3014;
update subject_info set subject_name = '물리화학2' where subject_id = 4002;
update subject_info set subject_name = '유기화학2' where subject_id = 4006;

commit;