from PyQt5.QtGui import *
from PyQt5.QtCore import *
from PyQt5.QtWidgets import *


class LabelListDialog(QDialog):
    def __init__(self, text="Enter object label", parent=None, listItem=None):
        super(LabelListDialog, self).__init__(parent)
        self.label = ""
        # self.setWindowFlags(Qt.Popup)

        model = QStringListModel()
        model.setStringList(listItem)

        layout = QVBoxLayout()

        self.listWidget = QListWidget(self)
        if listItem is not None:
            for item in listItem:
                self.listWidget.addItem(item)
        self.listWidget.itemDoubleClicked.connect(self.listItemDoubleClick)
        layout.addWidget(self.listWidget)

        self.setLayout(layout)
        self.setFixedHeight(300)

    def popUp(self, move=True):
        cursorPos = QCursor.pos()
        if move:
            self.move(cursorPos)
        self.show()
        if self.exec():
            return self.label
        return None

    def listItemDoubleClick(self, tQListWidgetItem):
        self.label = tQListWidgetItem.text().strip()
        if self.label:
            self.accept()
