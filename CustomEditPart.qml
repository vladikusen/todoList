import QtQuick 2.15

Rectangle {
    width: parent.width
    height: parent.height

    color: "#2a2a2a"

    signal saveData
    property alias edit : editData

    CustomHeader {
        id: editHeader

        label: "Edit Task"
    }

    CustomFieldRect {
        id: editData

        anchors.top: editHeader.bottom


        firstField.anchors.topMargin: 0

    }

    CustomButton {
        id: editButton

        width: parent.width * 0.5

        anchors.horizontalCenter: parent.horizontalCenter

        label: "Save changes"


        onClicked: {
            list.itemAtIndex(list.currentIndex).border.width = 0

            list.saveData()
            parent.saveData()

        }
    }

}
