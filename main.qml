import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.0

ApplicationWindow {
    id: mainWindow
    visible: true
    title: qsTr("Scroll")

    Component.onCompleted: {
        if(WINDOWS_PLATFORM) {
            height = 480;
            width = 640;
        }
    }

    Rectangle {
        id: header
        height: parent.height / 10
        color: Material.color(Material.Orange)
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0

        Menu {
            id: menu
            height: mainWindow.height

            MenuItem {
                text: "Settings"
            }
        }

        Button {
            id: button
            width: 57
            text: qsTr("≡")
            font.pointSize: 17
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            Material.elevation: 0
            Material.foreground: Material.Blue

            onClicked: {
                menu.open();
            }
        }

    }

    Timer {
        id: clock
        interval: 100
        running: false
        repeat: true

        property var previousTime: 0
        property var runningItemIndex: -1

        onTriggered: {
            var item = tasksGridView.model.get(runningItemIndex);
            var timeSpent = item.timeSpent;
            var currentTime = (new Date()).getTime();

            timeSpent += (currentTime - previousTime);

            previousTime = currentTime;

            tasksGridView.model.setProperty(runningItemIndex, "timeSpent", timeSpent);


        }

    }


    ScrollView {
        id: scrollView
        anchors.top: header.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.topMargin: 0

        GridView {
            id: tasksGridView
            anchors.fill: parent

            property var cHeight: 150
            property var cWidth: 250

            cellHeight: cHeight
            cellWidth: cWidth

            model: ListModel {
                ListElement {
                    taskName: "Hello"
                    timeSpent: 0
                }
                ListElement {
                    taskName: "Hello"
                    timeSpent: 0
                }
            }

            delegate: Rectangle {
                width: tasksGridView.cWidth
                height: tasksGridView.cHeight
                color: model.index === clock.runningItemIndex ? Material.color(Material.Red) : "white"
                Button {
                    id: delegateBtn
                    anchors.centerIn: parent
                    anchors.fill: parent
                    anchors.margins: 3
                    highlighted: true
                    Material.accent: Material.Orange

                    Text {
                        id: taskText
                        height: (parent.height * 2) / 3
                        text: qsTr(taskName)
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
                        text: {
                            return convertMills(timeSpent);
                        }
                        anchors.top: timeSpentLabel.top
                        anchors.topMargin: 0
                        anchors.right: parent.right
                        anchors.rightMargin: 5

                        function convertMills(mills) {
                            var hours = Math.floor(mills / (1000 * 60 * 60));
                            var remaining = mills % (1000 * 60 * 60);
                            var minutes = Math.floor(remaining / (1000 * 60));
                            remaining = remaining % (1000 * 60);
                            var seconds = Math.floor(remaining / 1000);
                            return hours + ":" + minutes + ":" + seconds
                        }


                        font.pointSize: 11
                    }

                    onClicked: {
                        clock.stop();
                        clock.previousTime = (new Date()).getTime();
                        clock.runningItemIndex = model.index;
                        clock.start();
                    }

                }
            }
        }

    }
    RoundButton {
        id: addBtn
        visible: true
        width: 60
        height: 60
        x: (mainWindow.width / 2) - (addBtn.width / 2)
        z: 1
        y: mainWindow.height - addBtn.height - 10
        text: "+"
        highlighted: true
        Material.accent: Material.Red
    }


}
