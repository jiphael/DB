select * 
FROM CLASS_INFO ci
JOIN CLASS_SCHEDULE_INFO csi ON (ci.CLASS_ID = csi.CLASS_ID)
JOIN CLASS_REQUEST cr ON (ci.CLASS_ID = cr.CLASS_ID)
WHERE cr.STUDENT_ID = 2019552020
;

update subject_info set subject_name = '��������' where subject_id = 2010;
update subject_info set subject_name = '�ΰ��ൿ����ȸȯ��' where subject_id = 3002;
update subject_info set subject_name = '�ڿ������' where subject_id = 3003;
update subject_info set subject_name = '��ȸ������õ�����' where subject_id = 3004;
update subject_info set subject_name = '���Űǰ���ȸ������' where subject_id = 3007;
update subject_info set subject_name = '��ȸ��������' where subject_id = 3011;
update subject_info set subject_name = '��ȸ�����ǹ��ǽ�' where subject_id = 3012;
update subject_info set subject_name = '������ȸ������' where subject_id = 3014;
update subject_info set subject_name = '����ȭ��2' where subject_id = 4002;
update subject_info set subject_name = '����ȭ��2' where subject_id = 4006;

commit;