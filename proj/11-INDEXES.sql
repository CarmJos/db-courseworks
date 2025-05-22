# 1.在对象资源管理器中创建索引。
# 在XSCJ数据库的Student表的“学号”列上建立非聚簇索引StuNo_ind。
# 在对象资源管理器中，选择XSCJ数据库的Student表，展开Student表，在“索引”节点上单击鼠标右键，在弹出的快捷菜单中选择“新建索引”命令，打开如图5.1所示的“新建索引”窗口。
# 在“索引名称”文本框中输入新建索引的名称StuNo_ind。单击“添加”按钮，出现如图5.2所示的“选择列”对话框，在其中选择用于创建索引的列“学号”，单击“确定”按钮。
# 索引创建完成后，可在对象资源管理器中展开表的“索引”节点，查看该表上的所有索引。


# 2.使用SQL语句创建和删除索引。
# 在XSCJ数据库Course表的“课程号”列上建立非聚簇索引CourseNo_ind。
CREATE INDEX CourseNo_ind
    ON Course (id);

# 删除索引CourseNo_ind。
DROP INDEX CourseNo_ind
    ON Course;


# 3.使用SQL语句查看索引。