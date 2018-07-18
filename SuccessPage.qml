import QtQuick 2.10
import QtQuick.Controls 2.2

Item {
    id:item1
    width: 800
    height: 448
    anchors.fill: parent
    Rectangle{
        id: statusRect
        width: 150
        height: 35
        color: "#94fb92"
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 20
        Text {
            id: statusText
            anchors.fill: parent
            text: qsTr("User Found")
            fontSizeMode: Text.Fit
            font.pointSize: 12
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
    Column{
        x: 200
        y: 145
        Repeater{
            id:rCol
            model:2
            Row{
                Repeater{
                    property int rowNum: index
                    id:rRow
                    model:["Name","ID","Name"]
                    Rectangle{
                        color: rRow.rowNum<1?"#a7c942":"white"
                        border.color: "#a7c942"
                        border.width: 1
                        width: 150
                        height: 30
                        Text {
                            id: txt
                            anchors.fill: parent
                            font.pointSize: 12
                            text: rRow.rowNum<1?modelData:""
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }
                }
            }
        }
    }

    Rectangle{
        id: regIDRect
        x: 350
        y: 263
        width: 150
        height: 35
        color: "#94fb92"
        visible: false
        Text {
            id: regIDText
            anchors.fill: parent
            text: "Registration ID"
            fontSizeMode: Text.Fit
            font.pointSize: 12
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    Button {
        id: btnSignIn
        x: 270
        y: 348
        text: qsTr("Sign In")
        font.pointSize: 12
        onClicked: {
            //NOTE: sign in happens here
            visible=false
            regIDRect.visible=true

        }
    }
    Button {
        id: btnReturn
        x: 389
        y: 348
        text: qsTr("Return to Main Menu")
        font.pointSize: 12
        onClicked: {
            gotoFirst()
        }
    }
}
