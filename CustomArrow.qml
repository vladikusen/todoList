import QtQuick 2.15

Rectangle {
    id: root

    width: parent.width
    height: parent.height * 0.3
    color: parent.color
    property alias arrow: canvas
    property int rotationAngle: 0
    property string arrowColor: "#383838"

    Canvas {
        id: canvas
        //anchors.fill: parent.parent
        x: parent.x  / 2
        y: parent.y / 2
        width: parent.width
        height: parent.height
        contextType: "2d"

        Connections {
            target: listCombo
            function onPressedChanged() {
                canvas.requestPaint()
            }
        }

        onPaint: {
            context.reset();
            context.lineWidth = 2
            context.moveTo(0, 0);
            context.lineCap = "square"
            context.strokeStyle = arrowColor
            context.lineTo(width * 0.5, height);
            context.lineTo(width, 0);
            context.stroke();
        }

    }
    transform: Rotation {
        id: rotate
        origin.x: root.width / 2
        origin.y: root.height / 2
        angle: rotationAngle

    }

}
