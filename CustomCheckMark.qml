import QtQuick 2.15


CustomProgressBar {
    size: todoItem.height * 0.6
    Image {
        width: parent.width * 0.5
        height: parent.height * 0.5

        anchors.centerIn: parent

        visible: model.done

        mipmap: true
        fillMode: Image.Stretch
        source: "checkmark.png"
    }
}

