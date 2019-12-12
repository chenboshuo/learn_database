#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""存储database的相关函数"""
# 参考 https://www.cnblogs.com/syh6324/p/9491518.html
from PyQt5.QtSql import QSqlDatabase, QSqlQuery # 导入QtSql模块

class DataBase:
    """数据库连接, 管理的类"""
    def __init__(self,Uid='testuser',Pwd='123456'):
        """链接数据库"""
        # 创建数据库连接并打开（未指定数据库名，创建默认连接）
        global db
        db = QSqlDatabase.addDatabase("QODBC")
        db.setDatabaseName(f"Driver=Sql Server;Server=localhost;Database=mytimetable;Uid={Uid};Pwd={Pwd}")
        db.open()  # 成功True, 失败False

        # 创建查询对象（使用默认数据库连接）
        query = QSqlQuery()

        # 查询数据库名（保存在master.sys.databases表中）
        query.exec ("Select name From sys.databases")

        # 依次打印数据库名（系统数据库除外）
        while query.next():
            # 获取名称字段的值
            name = query.value("name")
            # 如果不是系统数据库，打印
            if name.lower() not in ('master', 'tempdb', 'model', 'msdb'):
                print(name)
    def __del__(self):
        # 关闭数据库
        db.close()
if __name__ == '__main__':
    test = DataBase()

