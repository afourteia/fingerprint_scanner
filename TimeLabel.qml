import QtQuick 2.10
import QtQuick.Controls 2.2

Item {
    Timer{
        repeat: true
        running: true
        interval: 1000
        onTriggered: dateLabel.text=Date().toLocaleString()
    }

    Label {
        id: dateLabel
        anchors.fill: parent
        text: Date().toLocaleString()
        font.pointSize: 12
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
}
