import QtQuick 2.15

Item {
    id: root

    property int size: 150
    property int lineWidth: 2
    property real value: 0

    property color primaryColor: "#67d3a9"
    property color secondaryColor: "#747474"

    property int animationDuration: 600

    property alias progressBar: anim

    width: size
    height: size

    onValueChanged: {
        canvas.degree = value * 360;
    }

    Canvas {
        id: canvas

        property real degree: 0

        anchors.fill: parent
        antialiasing: true

        onDegreeChanged: {
            requestPaint();
        }

        onPaint: {
            var ctx = getContext("2d");

            var x = root.width/2;
            var y = root.height/2;

            var radius = root.size/2 - root.lineWidth
            var startAngle = (Math.PI/180) * 270;
            var fullAngle = (Math.PI/180) * (270 + 360);
            var progressAngle = (Math.PI/180) * (270 + degree);

            ctx.reset()

            ctx.lineCap = 'round';
            ctx.lineWidth = root.lineWidth;

            ctx.beginPath();
            ctx.arc(x, y, radius, startAngle, fullAngle);
            ctx.strokeStyle = root.secondaryColor;
            ctx.stroke();

            ctx.beginPath();
            ctx.arc(x, y, radius, startAngle, progressAngle);
            ctx.strokeStyle = root.primaryColor;
            ctx.stroke();
        }

        Behavior on degree {
            NumberAnimation {
                id: anim
                duration: root.animationDuration

                onRunningChanged: {
                    if(running === false) {
                        model.done = false
                    }
                }
            }

        }


    }
}

