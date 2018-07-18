import QtQuick 2.10
import QtQuick.Controls 2.2

Item {
    property int buttonSize: 50
    property var keyText: ["","ABC","DEF","GHI","JKL","MNO","PQRS","TUV","WXYZ","","",""]
    property var allNumbers: ["1","2","3","4","5","6","7","8","9","","0","\uE800"]
    property int lastKey: -1
    property int numClicks: 0
    Timer{
        id:timer1
        running: false
        repeat: false
        interval: 2000
        onTriggered: {
            lastKey=-1
            numClicks=0
            console.log("timer stopped")
        }
    }

    Row {
        Repeater {
            id:r1
            model: 3
            Column {
                Repeater{
                    id:r2
                    property int colIndex: index
                    model:4
                    Button{
                        id:btn
                        property int keyNum: r2.colIndex+1 + (index*r1.model)
                        property string keys: allNumbers[keyNum-1]+keyText[keyNum-1]
                        width: buttonSize
                        height: buttonSize
                        enabled: keyNum ==10 ? false:true
                        onClicked: {
                            console.log(keys)
                            if(keyNum==12){
                                receiver.text = receiver.text.slice(0,-1)
                            }else{
                                if(lastKey==keyNum){

                                    if(numClicks<keys.length){
                                        numClicks++
                                    }else{
                                        numClicks=1
                                    }
                                    receiver.text = receiver.text.slice(0,-1)+keys[numClicks-1]
                                    timer1.restart()
                                    console.log("numClicks= "+numClicks)
                                }else{
                                    lastKey=keyNum
                                    numClicks=1
                                    receiver.text = receiver.text+keys[numClicks-1]
                                    timer1.restart()
                                }
                            }
                        }
                        Text {
                            id: txt1
                            text: allNumbers[btn.keyNum-1]
                            font.family: "fontello"
                            font.pointSize: 18
                            font.bold: true
                            anchors.top: btn.keyNum<=9?parent.top:undefined
                            anchors.topMargin: btn.keyNum<=9? parent.height/5:undefined
                            anchors.verticalCenter: btn.keyNum>9? parent.verticalCenter:undefined
                            anchors.horizontalCenter: parent.horizontalCenter
                            horizontalAlignment: Text.AlignHCenter
                        }
                        Text {
                            id: txt2
                            font.pointSize: 10
                            text: keyText[btn.keyNum-1]
                            horizontalAlignment: Text.AlignHCenter
                            anchors.top: txt1.bottom
                            anchors.topMargin: 5
                            anchors.horizontalCenter: txt1.horizontalCenter
                        }
                    }
                }
            }
        }
    }


}
