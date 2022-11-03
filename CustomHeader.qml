import QtQuick 2.15

Rectangle {
    id: listHeader

    width: parent.width
    height: parent.height * 0.08

    color: "#2a2a2a"

    property alias label : innerText.text

    Text {
        id: innerText

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        color: "#67d3a9"
        text: ""
        font.pointSize: 4 * parent.height * 0.09
    }
}
