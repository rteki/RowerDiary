import QtQuick 2.9
import QtQuick.Controls 2.2

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Scroll")

    ScrollView {
        id: scrollView
        anchors.fill: parent

        GridView {
            id: gridView
            anchors.fill: parent

            property var cHeight: 150
            property var cWidth: 250

            cellHeight: cHeight
            cellWidth: cWidth

            model: [1,2,3,4,5]
            delegate: Rectangle {
                width: gridView.cWidth
                height: gridView.cHeight
                Button {
                    id: rectangle
                    anchors.centerIn: parent
                    anchors.fill: parent
                    anchors.margins: 3


                    Text {
                        id: taskText
                        height: (parent.height * 2) / 3
                        text: qsTr("asfasf")
                        wrapMode: Text.WordWrap
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 12
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                    }

                    Label {
                        id: timeSpentLabel
                        text: "Time spent:"
                        font.pointSize: 11
                        anchors.top: taskText.bottom
                        anchors.topMargin: 9
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                    }

                    Text {
                        id: timeCounter
                        text: qsTr("asf")
                        anchors.top: timeSpentLabel.top
                        anchors.topMargin: 0
                        font.pointSize: 11
                        anchors.left: timeSpentLabel.right
                        anchors.leftMargin: 10
                    }

                }
            }
        }

    }
    RoundButton {
        id: addBtn
        visible: true
        x: (mainWindow.width / 2) - (addBtn.width / 2)
        z: 1
        y: mainWindow.height - addBtn.height - 10
        text: "+"
    }
}
