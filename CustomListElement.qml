import QtQuick 2.15
import QtQuick.Controls 2.5


Rectangle {
    id: mainRect

    width: list.width
    height: list.height / 5

    radius: 10 * height * 0.04

    color: leftPart.color

    MouseArea {
        id: todoArea

        anchors.fill: parent

        onClicked: {
            anim.start()

            list.editData()
            rightPartLoader.item.edit.firstField.acceptedText = model.name
            rightPartLoader.item.edit.secondField.acceptedText = model.date
            rightPartLoader.item.edit.thirdField.acceptedText = model.description

            list.itemAtIndex(list.currentIndex).border.width = 0
            list.currentIndex = index
            list.itemAtIndex(list.currentIndex).border.width = 2
            list.itemAtIndex(list.currentIndex).border.color = "#67d3a9"

        }

        Connections {
            target: list
            function onSaveData() {
                if(index == list.currentIndex) {
                    model.name = rightPartLoader.item.edit.firstField.getText
                    model.date = rightPartLoader.item.edit.secondField.getText
                    model.description = rightPartLoader.item.edit.thirdField.getText
                }
            }
        }
    }
    Rectangle {
        id: todoItem

        width: parent.width - parent.width * 0.1
        height: parent.height - parent.height * 0.3

        radius: parent.radius

        anchors.centerIn: parent
        color: parent.color

        CustomWhiteText {
            id: nameText

            text: model.name
        }
        CustomWhiteText {
            id: dateText

            anchors.top: nameText.bottom

            text: model.date
        }
        CustomWhiteText {
            id: descriptionText

            anchors.top: dateText.bottom

            text: model.description
        }

        CheckBox {
            id: todoCheck

            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter

            checked: model.done

            indicator: CustomCheckMark {
                id: indicate
                value: todoCheck.checked ? 1 : 0
                anchors.verticalCenter: parent.verticalCenter
            }

            onClicked: {
                model.done = checked
            }
        }

    }

    SequentialAnimation {
        id: anim

        PropertyAnimation {
            target: todoItem
            property: "scale"
            to: 1.1
            duration: 200
            easing.type: Easing.InOutQuad
        }

        PropertyAnimation {
            target: todoItem
            property: "scale"
            to: 1.0
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }
}
