insert into learning.Course (Cno, Cname, Ccredit, Cpno)
values  ('81001', '程序设计基础与C语言', 4, null),
        ('81002', '数据结构', 4, '81001'),
        ('81003', '数据库系统概论', 4, '81002'),
        ('81004', '信息系统概论', 4, '81003'),
        ('81005', '操作系统', 4, '81001'),
        ('81006', 'Python语言', 3, '81002'),
        ('81007', '离散数学', 4, null),
        ('81008', '大数据技术概论', 4, '81003');