import QtQuick 2.10
import QtQuick.Controls 2.2

Item {
    width: 800
    height: 448
    Rectangle{
        id: statusRect
        width: 150
        height: 35
        color: "#fc9393"
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 20
        Text {
            id: statusText
            anchors.fill: parent
            text: qsTr("User Not Found")
            fontSizeMode: Text.Fit
            font.pointSize: 12
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
    TextField {
        id: textFieldID2
        x: 328
        y: 204
        width: 144
        height: 40
        text: "#firstPage.textFieldID.text#"
        font.pointSize: 12
    }

    Label {
        id: idLabel
        x: 58
        y: 102
        text: qsTr("ID Searched")
        font.pointSize: 12
        anchors.right: textFieldID2.left
        anchors.rightMargin: 6
        anchors.verticalCenter: textFieldID2.verticalCenter
    }

    Button {
        id: btnReturn
        x: 300
        y: 305
        text: qsTr("Return to Main Menu")
        font.pointSize: 12
        onClicked: {
            gotoFirst()
        }
    }
}
