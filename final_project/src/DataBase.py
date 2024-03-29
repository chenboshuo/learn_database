#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""存储database的相关函数"""
# 参考 https://www.cnblogs.com/syh6324/p/9491518.html
from PyQt5.QtSql import QSqlDatabase, QSqlQueryModel, QSqlQuery # 导入QtSql模块
from PyQt5.QtWidgets import QTableView, QApplication

class DataBase:
    """数据库连接, 管理的类"""
    def __init__(self,username='testuser',password='123456',server="localhost",driver="Sql Server"):
        """链接数据库"""
        # 创建数据库连接并打开（未指定数据库名，创建默认连接）
        self.db = QSqlDatabase.addDatabase("QODBC")
        self.db.setDatabaseName(f"Driver={driver};Server={server};Database=mytimetable;Uid={username};Pwd={password}")
        if not self.db.open():
            self.db.close()
            raise IOError("database not open")



    def __del__(self):
        """关闭数据库"""
        self.db.close()

    def display_data(self, sql_statement):
        """向主界面展示查询结果"""
        qry = QSqlQuery(self.db)
        qry.prepare(sql_statement)
        qry.exec()

        model = QSqlQueryModel()
        model.setQuery(qry)

        view = QTableView()
        view.setModel(model)
        return view


if __name__ == '__main__':
    test = DataBase()


