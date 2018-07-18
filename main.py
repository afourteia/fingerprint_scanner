import sys

from PyQt5 import QtCore, QtGui, QtQml
from PyQt5.QtCore import QUrl
from PyQt5.QtGui import QFontDatabase

if __name__ == '__main__':
    app = QtGui.QGuiApplication(sys.argv)
    app.setAttribute(QtCore.Qt.AA_EnableHighDpiScaling)

    fontDatabase = QFontDatabase()
    if fontDatabase.addApplicationFont("fonts/fontello.ttf") == -1:
        print("Failed to load fontello.ttf")

    # database connection object should be created here and passed to the QML

    engine = QtQml.QQmlApplicationEngine()
    engine.load(QUrl("main.qml"))

    sys.exit(app.exec_())
    