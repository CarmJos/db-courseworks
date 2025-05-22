# 1.在对象资源管理器中创建视图。
# 创建一个名为是Student_male的视图，包含所有男学生的信息。
# 在对象资源管理器中选择XSCJ数据库，展开XSCJ数据库，在“视图”节点上单击鼠标右键，在弹出的快捷菜单中选择“新建视图”，
# 打开“添加表”对话框。选中“Student”表，单击“添加”，然后再单击“关闭”按钮。
# 在“Student”窗格中选择所有列，在中间的条件窗格的“列”一栏中选择“性别”，“输出”栏不勾选，
# 在“筛选器”一栏中输入“男”。单击工具栏的“保存”按钮，在所弹出的“选择名称”对话框中输入视图的名称Student_male,单击“确定”按钮。
SELECT *
FROM Student
where gender = '男';

# 2.使用SQL语句创建视图。
# 要求：创建名为Student_Computer的视图，包含计算机科学与技术专业的学生信息。
# 在查询分析器输入SQL语句并执行。
CREATE VIEW Student_Computer AS
SELECT *
FROM Student
WHERE major = '计算机科学与技术';


# 3.视图查询。
# 1)查询Student_male视图
SELECT *
FROM Student_male;

# 2)在Student_Computer视图上查询计算SELECT 机科学技术专业在1989年出生的学生信息。
SELECT *
FROM Student_Computer
WHERE YEAR(birthday) = 1989;

# 4.使用SQL语句修改视图的定义。
# 要求：将Student_male视图定义更改为包含计算机科学与技术专业所有男学生的信息。
# 可用SELECT * FROM Student_male语句检查对视图的修改。
CREATE OR REPLACE VIEW Student_male AS
SELECT *
FROM Student
WHERE major = '计算机科学与技术'
  AND gender = '男';
