from Login import Login
import sys
from PyQt5.QtWidgets import QApplication
from PyQt5 import QtWidgets
from MainUi import MainUi


# 登录窗口
app = QApplication(sys.argv)
login = Login()
login.show()
if login.exec_() == QtWidgets.QDialog.Accepted:
    gui = MainUi()
    gui.show()
    sys.exit(app.exec_())
