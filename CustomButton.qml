import QtQuick 2.15
import QtQuick.Controls 2.5


Button {
    id: button
    property alias label : innerText.text

    height: parent.height * 0.06

    anchors.bottom: parent.bottom
    anchors.bottomMargin: parent.height * 0.03

    Text {
        id: innerText

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        text: ""
        color: "#67d3a9"
        font.pointSize: 4 * parent.height * 0.08
    }

    background: Rectangle {

        color: "#2a2a2a"

        radius: 25
        border.width: 2
        border.color: "#67d3a9"
    }

    onPressed: anim.start()

    SequentialAnimation {
        id: anim

        PropertyAnimation {
            target: button
            property: "scale"
            to: 1.2
            duration: 200
            easing.type: Easing.InOutQuad
        }

        PropertyAnimation {
            target: button
            property: "scale"
            to: 1.0
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }

}
