import QtQuick 2.10
import QtQuick.Controls 2.2

Item {
    id: item1
    property alias textFieldID: textFieldID
    property alias busyIndicator: busyIndicator

    Button {
        id: btnDbUpdate
        text: qsTr("Click to update Database")
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 20
        font.pointSize: 12
        onClicked: {
            console.log("Database update")
        }
    }
    TextField {
        id: textFieldID
        x: 142
        y: 104
        width: 144
        height: 40
        font.pointSize: 12
    }

    Label {
        id: idLabel
        x: 58
        y: 102
        text: qsTr("Enter your ID")
        font.pointSize: 12
        anchors.right: textFieldID.left
        anchors.rightMargin: 6
        anchors.verticalCenter: textFieldID.verticalCenter
    }

    Button {
        id: btnScan
        x: 150
        y: 167
        text: qsTr("Click to Scan")
        font.pointSize: 12
        onClicked: {
            busyIndicator.running=true
            //NOTE: the database query should be put in here but this is a demo for now
            //change response to false to go to errorPage
            var response=true;
            if(response){
                delay(5000,function() {
                    gotoSuccess()
                })
            }else{
                delay(5000,function(){
                    gotoError()
                })
            }
        }
    }

    Label {
        id: statusLabel
        x: 66
        y: 237
        text: qsTr("Status")
        font.pointSize: 12
        anchors.right: statusRect.left
        anchors.rightMargin: 6
        anchors.verticalCenter: statusRect.verticalCenter
    }
    Rectangle{
        id: statusRect
        x: 145
        y: 239
        width: 139
        height: 35
        color: busyIndicator.running? "#f1fc93":"#94fb92"
        Text {
            id: statusText
            anchors.fill: parent
            text: busyIndicator.running? qsTr("Scanning"):qsTr("Ready to Scan")
            fontSizeMode: Text.Fit
            font.pointSize: 12
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    BusyIndicator {
        id: busyIndicator
        x: 166
        y: 304
        width: 100
        height: 100
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: statusRect.horizontalCenter
        running: false
        visible: true
    }
    TouchPad{
        id:touchPad
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 20
        width: 300
        height: width+(width/3)
        buttonSize: width/3
        property alias receiver: textFieldID
    }
    function gotoSuccess(){
        firstPage.visible=false
        successPage.visible=true
    }
    function gotoError(){
        firstPage.visible=false
        errorPage.visible=true
    }
    Timer{
        id:timer
    }
    function delay(delayTime, cb) {
        timer.interval = delayTime;
        timer.repeat = false;
        timer.triggered.connect(cb);
        timer.start();
    }
}
