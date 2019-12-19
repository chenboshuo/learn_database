from PyQt5.QtSql import QSqlDatabase, QSqlQueryModel, QSqlQuery
from PyQt5.QtWidgets import QTableView, QApplication
import sys

SERVER_NAME = '<Server Name>'
DATABASE_NAME = '<Database Name>'
USERNAME = ''
PASSWORD = ''


def createConnection():
    connString = f'DRIVER={{SQL Server}};' \
        f'SERVER={SERVER_NAME};' \
        f'DATABASE={DATABASE_NAME}'

    global db
    db = QSqlDatabase.addDatabase('QODBC')
    db.setDatabaseName(connString)

    if db.open():
        print('connect to SQL Server successfully')
        return True
    else:
        print('connection failed')
        return False


def displayData(sqlStatement):
    print('processing query...')
    qry = QSqlQuery(db)
    qry.prepare(sqlStatement)
    qry.exec()

    model = QSqlQueryModel()
    model.setQuery(qry)

    view = QTableView()
    view.setModel(model)
    return view


if __name__ == '__main__':
    app = QApplication(sys.argv)

    if createConnection():
        SQL_STATEMENT = 'SELECT * FROM Sales.Store'
        dataView = displayData(SQL_STATEMENT)
        dataView.show()

    app.exit()
    sys.exit(app.exec_())