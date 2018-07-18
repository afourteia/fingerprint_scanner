import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.2

Window {
    id: window
    visible: true
    width: 800
    height: 480
    title: qsTr("Fingerprint Scanner")
    property alias firstPage: firstPage
    property alias errorPage: errorPage
    property alias successPage: successPage
//    property alias gotoFirst: gotoFirst

    function gotoFirst(){
        firstPage.visible=true
        errorPage.visible=false
        successPage.visible=false
        firstPage.busyIndicator.running=false
    }

    Item {
        id: header
        height: 32
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.left: parent.left
        TimeLabel{
            id:timeLabel
            x: 268
            width: 372
            height: 20
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.rightMargin: 10
            anchors.right: parent.right
        }
    }
    Item {
        id:body
        anchors.top: header.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.topMargin: 10
        FirstPage{
            id:firstPage
            anchors.fill: body
            visible: true
        }
        ErrorPage{
            id:errorPage
            visible: false
        }
        SuccessPage{
            id:successPage
            visible: false
        }
    }

}
