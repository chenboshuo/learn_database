# code from
# https://mp.weixin.qq.com/s?__biz=MzI5NDY1MjQzNA==&mid=2247488070&idx=3&sn=0d7fa40a22165e497d1fd27228ff17de&chksm=ec5ecd3bdb29442d8d32a93e0cd35b5f971963a35bceb7e2130aac07493dd04b11acbb370573
from PyQt5 import QtCore, QtGui, QtWidgets
import sys
import qtawesome
from DataBase import DataBase


class MainUi(QtWidgets.QMainWindow):
    def __init__(self,db):
        super().__init__()
        self.db = db
        self.init_ui()

    def init_ui(self):
        # self.setFixedSize(720, 525)
        self.setFixedSize(894, 525)
        self.main_widget = QtWidgets.QWidget()  # 创建窗口主部件
        self.main_layout = QtWidgets.QGridLayout()  # 创建主部件的网格布局
        self.main_widget.setLayout(self.main_layout)  # 设置窗口主部件布局为网格布局
        self.left_widget = QtWidgets.QWidget()  # 创建左侧部件
        self.left_widget.setObjectName('left_widget')
        self.left_layout = QtWidgets.QGridLayout()  # 创建左侧部件的网格布局层
        self.left_widget.setLayout(self.left_layout)  # 设置左侧部件布局为网格
        self.right_widget = QtWidgets.QWidget()  # 创建右侧部件
        self.right_widget.setObjectName('right_widget')
        self.right_layout = QtWidgets.QGridLayout()
        self.right_widget.setLayout(self.right_layout)  # 设置右侧部件布局为网格
        self.main_layout.addWidget(self.left_widget, 0, 0, 12, 2)  # 左侧部件在第0行第0列，占8行3列
        self.main_layout.addWidget(self.right_widget, 0, 2, 12, 10)  # 右侧部件在第0行第3列，占8行9列
        self.setCentralWidget(self.main_widget)  # 设置窗口主部件

        # self.table_widget = QtWidgets.QTableView()  # 创建一个表格部件
        self.table_widget = self.db.display_data('select * from class_timetable')
        self.right_layout.addWidget(self.table_widget, 0, 3) # 将表格部件插入窗口
        self.left_close = QtWidgets.QPushButton("")  # 关闭按钮
        self.left_close.clicked.connect(self.close)
        self.left_visit = QtWidgets.QPushButton("")  # 空白按钮
        self.left_mini = QtWidgets.QPushButton("")  # 最小化按钮
        self.left_close.setFixedSize(15, 15)  # 设置关闭按钮的大小
        self.left_visit.setFixedSize(15, 15)  # 设置按钮大小
        self.left_mini.setFixedSize(15, 15)  # 设置最小化按钮大小
        self.left_close.setStyleSheet(
            '''QPushButton{background:#F76677;border-radius:5px;}QPushButton:hover{background:red;}''')
        self.left_visit.setStyleSheet(
            '''QPushButton{background:#F7D674;border-radius:5px;}QPushButton:hover{background:yellow;}''')
        self.left_mini.setStyleSheet(
            '''QPushButton{background:#6DDF6D;border-radius:5px;}QPushButton:hover{background:green;}''')
        self.left_label_1 = QtWidgets.QPushButton("我的课表")
        self.left_label_1.setObjectName('left_label')
        self.left_label_2 = QtWidgets.QPushButton("数据导入")
        self.left_label_2.setObjectName('left_label')
        self.left_label_3 = QtWidgets.QPushButton("其他")
        self.left_label_3.setObjectName('left_label')
        #  qtawesome.icon: http://fontawesome.dashgame.com/
        self.left_button_1 = QtWidgets.QPushButton(qtawesome.icon('fa.th', color='white'), "班级课表")
        self.left_button_1.setObjectName('left_button')
        self.left_button_2 = QtWidgets.QPushButton(qtawesome.icon('fa.heart', color='white'), "关注课表")
        self.left_button_2.setObjectName('left_button')
        self.left_button_3 = QtWidgets.QPushButton(qtawesome.icon('fa.th-list', color='white'), "其他查询")
        self.left_button_3.setObjectName('left_button')
        self.left_button_4 = QtWidgets.QPushButton(qtawesome.icon('fa.cloud', color='white'), "教务系统")
        self.left_button_4.setObjectName('left_button')
        self.left_button_5 = QtWidgets.QPushButton(qtawesome.icon('fa.edge', color='white'), "html")
        self.left_button_5.setObjectName('left_button')
        self.left_button_6 = QtWidgets.QPushButton(qtawesome.icon('fa.cog', color='white'), "设置")
        self.left_button_6.setObjectName('left_button')
        self.left_button_7 = QtWidgets.QPushButton(qtawesome.icon('fa.code', color='white'), "开发者模式")
        self.left_button_7.setObjectName('left_button')
        self.left_button_8 = QtWidgets.QPushButton(qtawesome.icon('fa.github', color='white'), "关注")
        self.left_button_8.setObjectName('left_button')
        self.left_button_9 = QtWidgets.QPushButton(qtawesome.icon('fa.question', color='white'), "帮助反馈")
        self.left_button_9.setObjectName('left_button')
        self.left_xxx = QtWidgets.QPushButton(" ")
        self.left_layout.addWidget(self.left_mini, 0, 0, 1, 1)
        self.left_layout.addWidget(self.left_close, 0, 2, 1, 1)
        self.left_layout.addWidget(self.left_visit, 0, 1, 1, 1)
        self.left_layout.addWidget(self.left_label_1, 1, 0, 1, 3)
        self.left_layout.addWidget(self.left_button_1, 2, 0, 1, 3)
        self.left_layout.addWidget(self.left_button_2, 3, 0, 1, 3)
        self.left_layout.addWidget(self.left_button_3, 4, 0, 1, 3)
        self.left_layout.addWidget(self.left_label_2, 5, 0, 1, 3)
        self.left_layout.addWidget(self.left_button_4, 6, 0, 1, 3)
        self.left_layout.addWidget(self.left_button_5, 7, 0, 1, 3)
        self.left_layout.addWidget(self.left_label_3, 8, 0, 1, 3)
        self.left_layout.addWidget(self.left_button_6, 9, 0, 1, 3)
        self.left_layout.addWidget(self.left_button_7, 10, 0, 1, 3)
        self.left_layout.addWidget(self.left_button_8, 11, 0, 1, 3)
        self.left_layout.addWidget(self.left_button_9, 12, 0, 1, 3)
        # 左侧菜单中的按钮和文字颜色设置为白色，并且将按钮的边框去掉
        self.left_widget.setStyleSheet('''
            QPushButton{border:none;color:white;}
            QPushButton#left_label{
                border:none;
                border-bottom:1px solid white;
                font-size:18px;
                font-weight:700;
                font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            }
            QPushButton#left_button:hover{border-left:4px solid red;font-weight:700;}
            QWidget#left_widget{
                background:gray;
                border-top:1px solid white;
                border-bottom:1px solid white;
                border-left:1px solid white;
                border-top-left-radius:10px;
                border-bottom-left-radius:10px;
            }
        ''')
        # # 完成了左侧部件的美化之后，我们接着对右侧的内容部件进行处理，首先是顶部的搜索框，因为搜索框使用的是QLineEdit()
        # # 部件，默认情况下棱角分明很是不好看，我们对其进行圆角处理：
        # self.right_bar_widget_search_input.setStyleSheet(
        #     '''QLineEdit{
        #             border:1px solid gray;
        #             width:300px;
        #             border-radius:10px;
        #             padding:2px 4px;
        #     }''')

        # # 因为图形界面是会呈现出无边框的圆角形式，所以右侧的部件的右上角和右下角需要先行处理为圆角的，
        # # 同时背景设置为白色。对推荐模块、音乐列表模块和音乐歌单模块的标题我们也需要对其字体进行放大处理，
        # # 所以最后的样式为：
        # self.right_widget.setStyleSheet('''
        #     QWidget#right_widget{
        #         color:#232C51;
        #         background:white;
        #         border-top:1px solid darkGray;
        #         border-bottom:1px solid darkGray;
        #         border-right:1px solid darkGray;
        #         border-top-right-radius:10px;
        #         border-bottom-right-radius:10px;
        #     }
        #     QLabel#right_lable{
        #         border:none;
        #         font-size:16px;
        #         font-weight:700;
        #         font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
        #     }
        # ''')

        # # 因为推荐模块和歌单模块中使用的都是QToolButton()
        # # 部件，所以其样式也类似：
        # self.right_recommend_widget.setStyleSheet(
        #     '''
        #         QToolButton{border:none;}
        #         QToolButton:hover{border-bottom:2px solid #F76677;}
        #     ''')
        # self.right_playlist_widget.setStyleSheet(
        #     '''
        #         QToolButton{border:none;}
        #         QToolButton:hover{border-bottom:2px solid #F76677;}
        #     ''')

        # # 而音乐列表使用的是QPushButton()
        # # 按钮部件，我们需要对其去除边框，修改字体和颜色等，所以其样式为：
        # self.right_newsong_widget.setStyleSheet('''
        #     QPushButton{
        #         border:none;
        #         color:gray;
        #         font-size:12px;
        #         height:40px;
        #         padding-left:5px;
        #         padding-right:10px;
        #         text-align:left;
        #     }
        #     QPushButton:hover{
        #         color:black;
        #         border:1px solid #F3F3F5;
        #         border-radius:10px;
        #         background:LightGray;
        #     }
        # ''')

        self.setWindowOpacity(0.9)  # 设置窗口透明度
        # self.setAttribute(QtCore.Qt.WA_TranslucentBackground)  # 设置窗口背景透明
        self.setWindowFlag(QtCore.Qt.FramelessWindowHint)  # 隐藏边框
        self.main_layout.setSpacing(0)

if __name__ == '__main__':
    app = QtWidgets.QApplication(sys.argv)
    gui = MainUi()
    gui.show()
    sys.exit(app.exec_())