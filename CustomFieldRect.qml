import QtQuick 2.15

Rectangle {
    id: addFields

    width: parent.width
    height: parent.height * 0.3

    property alias firstField: first
    property alias secondField: second
    property alias thirdField: third

    color: parent.color


    CustomTextField {
        id: first

        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.1

        placeHolder: ""
        acceptedText: ""
    }
    CustomTextField {
        id: second
        anchors.top: first.bottom

        placeHolder: ""
        acceptedText: ""
    }
    CustomTextField {
        id: third

        anchors.top: second.bottom

        placeHolder: ""
        acceptedText: ""
    }
}
