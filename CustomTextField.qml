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
    property alias textAnimation: textAnim

    TextField {
        id: innerText

        //anchors.fill: parent
        width: parent.width
        height: parent.height
        leftPadding: parent.height * 0.3

        color: "white"

        maximumLength: 20

        placeholderTextColor: "#5a5a5a"

        background: Rectangle {
            anchors.fill: parent

            width: root.width
            height: root.height - 0.1

            color: "#3b3b3b"

            radius: 15 * root.width * 0.1
        }

        SequentialAnimation {
            id: textAnim

            NumberAnimation {
                target: innerText
                property: "x"
                running: false
                from: x
                to: x + 10
                duration: 60
            }

            NumberAnimation {
                target: innerText
                property: "x"
                running: false
                from: x
                to: x - 20
                duration: 60
            }

            NumberAnimation {
                target: innerText
                property: "x"
                running: false
                from: x
                to: x - 10
                duration: 60
            }



        }
    }
}

