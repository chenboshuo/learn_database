# code source: https://blog.csdn.net/La_vie_est_belle/article/details/82389163
# 遵循 CC 4.0 BY-SA 版权协议
import sys
from PyQt5.QtWidgets import QApplication, QWidget, QDialog, QLabel, QLineEdit, QPushButton, \
    QGridLayout, QVBoxLayout, QHBoxLayout, QMessageBox
from PyQt5 import QtWidgets
from DataBase import DataBase



class Login(QtWidgets.QDialog):
    """一个实现登录功能的类"""
    def __init__(self):
        super(Login, self).__init__()
        self.resize(300, 100)

        self.user_label = QLabel('用户名:', self)
        self.pwd_label = QLabel('密码:', self)
        self.user_line = QLineEdit(self)
        self.pwd_line = QLineEdit(self)
        self.login_button = QPushButton('链接数据库', self)

        self.grid_layout = QGridLayout()
        self.h_layout = QHBoxLayout()
        self.v_layout = QVBoxLayout()

        self.line_edit_init()  # 单行文本输入框
        self.pushbutton_init()  # 按钮
        self.layout_init()

    def layout_init(self):
        self.grid_layout.addWidget(self.user_label, 0, 0, 1, 1)
        self.grid_layout.addWidget(self.user_line, 0, 1, 1, 1)
        self.grid_layout.addWidget(self.pwd_label, 1, 0, 1, 1)
        self.grid_layout.addWidget(self.pwd_line, 1, 1, 1, 1)
        self.h_layout.addWidget(self.login_button)
        # self.h_layout.addWidget(self.signin_button)
        self.v_layout.addLayout(self.grid_layout)
        self.v_layout.addLayout(self.h_layout)

        self.setLayout(self.v_layout)

    def line_edit_init(self):
        """登录框的灰色文字"""
        self.user_line.setPlaceholderText('输入数据库用户名')
        self.pwd_line.setPlaceholderText('输入数据库密码')
        self.pwd_line.setEchoMode(QLineEdit.Password)  # 让密码变成圆点

        self.user_line.textChanged.connect(self.check_input_func)
        self.pwd_line.textChanged.connect(self.check_input_func)

    def check_input_func(self):
        """检查输入框是否有文字, 有文字则启动登录按钮"""
        if self.user_line.text() and self.pwd_line.text():
            self.login_button.setEnabled(True)
        else:
            self.login_button.setEnabled(False)

    def pushbutton_init(self):
        """初始化登录按钮, 在一开始时不可用"""
        self.login_button.setEnabled(False)

    def pushbutton_init(self):
        """验证账号密码是否正确"""
        self.login_button.setEnabled(False)
        self.login_button.clicked.connect(self.check_login_func)

    def check_login_func(self):
        """用于检测登录是否成功"""
        try:
            # db = DataBase(self.user_line.text(),self.pwd_line.text()) # 检测是否可以链接
            self.db = DataBase() # TODO 为了测试, 无条件登录
        except IOError:
            QMessageBox.critical(self, '错误', '数据库链接失败')
        else:
            info = QMessageBox()
            info.information(self, 'Information', '成功登录')
            self.accept()

        # 登录失败后清空输入
        # self.user_line.clear()
        self.pwd_line.clear()

# 测试登录界面
if __name__ == '__main__':
    app = QApplication(sys.argv)
    demo = Login()
    demo.show()
    sys.exit(app.exec_())