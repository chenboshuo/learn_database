from Login import Login
import sys
from PyQt5.QtWidgets import QApplication, QWidget, QDialog, QLabel, QLineEdit, QPushButton, \
    QGridLayout, QVBoxLayout, QHBoxLayout, QMessageBox
from PyQt5 import QtCore, QtGui, QtWidgets
from MainUi import MainUi


# 登录窗口
app = QApplication(sys.argv)
login = Login()
login.show()
sys.exit(app.exec_())
