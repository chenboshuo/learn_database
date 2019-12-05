# code source: https://blog.csdn.net/La_vie_est_belle/article/details/82389163
# 遵循 CC 4.0 BY-SA 版权协议
import sys
from PyQt5.QtWidgets import QApplication, QWidget, QDialog, QLabel, QLineEdit, QPushButton, \
    QGridLayout, QVBoxLayout, QHBoxLayout, QMessageBox

# 用于测试登录的用户密码
USER_PWD = {
        'admin': '123456'
    }


class Login(QWidget):
    """一个实现登录功能的类"""
    def __init__(self):
        super(Login, self).__init__()
        self.resize(300, 100)

        self.user_label = QLabel('Username:', self)
        self.pwd_label = QLabel('Password:', self)
        self.user_line = QLineEdit(self)
        self.pwd_line = QLineEdit(self)
        self.login_button = QPushButton('Log in', self)

        self.grid_layout = QGridLayout()
        self.h_layout = QHBoxLayout()
        self.v_layout = QVBoxLayout()

        self.lineedit_init()  # 单行文本输入框
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


    def lineedit_init(self):
        """登录框的灰色文字"""
        self.user_line.setPlaceholderText('Please enter your username')
        self.pwd_line.setPlaceholderText('Please enter your password')

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
        if USER_PWD.get(self.user_line.text()) == self.pwd_line.text():
            QMessageBox.information(self, 'Information', 'Log in Successfully!')
        else:
            QMessageBox.critical(self, 'Wrong', 'Wrong Username or Password!')

        self.user_line.clear()
        self.pwd_line.clear()

if __name__ == '__main__':
    app = QApplication(sys.argv)
    demo = Login()
    demo.show()
    sys.exit(app.exec_())