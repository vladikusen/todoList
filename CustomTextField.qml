import QtQuick 2.15
import QtQuick.Controls 2.5

Rectangle {
    id: root

    width: parent.width - parent.width * 0.1
    height: parent.height / 3 - parent.height * 0.07

    anchors.horizontalCenter: parent.horizontalCenter
    anchors.topMargin: parent.height * 0.05
    color: parent.color

    property alias placeHolder: innerText.placeholderText
    property alias acceptedText: innerText.text
    property string getText: innerText.text

    TextField {
        id: innerText

        anchors.fill: parent
        leftPadding: parent.height * 0.3

        color: "white"

        placeholderTextColor: "#5a5a5a"

        background: Rectangle {
            anchors.fill: parent

            width: root.width
            height: root.height - 0.1

            color: "#3b3b3b"

            radius: 15 * root.width * 0.1
        }
    }
}

