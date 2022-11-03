import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5

Rectangle {
    anchors.fill: parent


    color: "#242424"


    BgRect {
        id: leftPart

        anchors.left: parent.left

        ListView {
            id: list

            width: parent.width; height: parent.height * 0.8
            spacing: parent.height * 0.02

            signal editData
            signal saveData

            headerPositioning: ListView.OverlayHeader

            header: Rectangle {
                width: leftPart.width
                height: leftPart.height * 0.08 + (leftPart.height * 0.3) / 3 - (leftPart.height * 0.3) * 0.05
                z: 2
                color: leftPart.color
                CustomHeader {
                    id: todoHeader

                    width: leftPart.width
                    height: leftPart.height * 0.08

                    label: "To Do"
                }

                ComboBox {
                    id: listCombo

                    width: parent.width
                    height: (leftPart.height * 0.3) / 3 - (leftPart.height * 0.3) * 0.07

                    anchors.top: todoHeader.bottom

                    model: ListModel {
                        ListElement {
                           text: "All"
                        }
                        ListElement {
                            text: "Done"
                        }
                        ListElement {
                            text: "Undone"
                        }
                    }

                    delegate: ItemDelegate {
                        width: listCombo.width; height: listCombo.height * 0.8
                        padding: 0

                        contentItem: Text {
                            leftPadding: listCombo.width * 0.05

                            text: model.text
                            font: listCombo.font
                            color: "#67d3a9"
                            verticalAlignment: Text.AlignVCenter
                        }

                        background: Rectangle {
                            width: parent.width
                            height: parent.height

                            color: rightPart.color
                        }


                        highlighted: listCombo.highlightedIndex === index
                    }

                    onCurrentValueChanged: {
                        if(currentValue === "All") {
                            FilteredTodosModel.doneFilterEnabled = false
                            FilteredTodosModel.unDoneFilterEnabled = false
                        }
                        if(currentValue === "Done") {
                            FilteredTodosModel.doneFilterEnabled = true
                            FilteredTodosModel.unDoneFilterEnabled = false
                        }
                        if(currentValue === "Undone") {
                            FilteredTodosModel.unDoneFilterEnabled = true
                            FilteredTodosModel.doneFilterEnabled = false
                        }
                    }

                    contentItem: Text {
                         leftPadding: listCombo.width * 0.05

                         text: listCombo.displayText
                         font: listCombo.font
                         color: "#67d3a9"
                         verticalAlignment: Text.AlignVCenter
                     }

                    background: Rectangle {
                        id: comboBg

                        width: parent.width
                        height: parent.height

                        color: leftPart.color
                        border.width: 2
                        border.color: "#67d3a9"

                        radius: 15 * parent.width * 0.1
                    }


                    popup:
                        Popup {
                             width: listCombo.width
                             implicitHeight: contentItem.implicitHeight
                             padding: 6 * height * 0.015

                             contentItem: ListView {
                                 id: comboPopupListView
                                 clip: true
                                 width: parent.width

                                 implicitHeight: listCombo.height * 2

                                 model: listCombo.popup.visible ? listCombo.delegateModel : null

                                 highlight: Rectangle {
                                     z: 1
                                     width: listCombo.width
                                     height: listCombo.height
                                     color: "#67d3a9"
                                     opacity: 0.2
                                 }
                                 currentIndex: listCombo.highlightedIndex

                             }



                             background: Rectangle {

                                 width: parent.width
                                 height: parent.height

                                 color: leftPart.color
                                 border.width: 2
                                 border.color: "#67d3a9"

                                 radius: 15 * height * 0.01

                             }
                         }

                }

            }



            model: FilteredTodosModel

            delegate: CustomListElement {
                id: listDelegate
            }

            add: Transition {
                NumberAnimation {
                    property: "opacity"
                    from: 0
                    to: 1.0
                    duration: 400
                }
                NumberAnimation {
                    property: "scale"
                    from: 0
                    to: 1.0
                    duration: 400
                }
                NumberAnimation { properties: "x, y"; duration: 600; easing.type: Easing.BezierSpline }
            }

            displaced: Transition {
                NumberAnimation { properties: "x,y"; duration: 600; easing.type: Easing.BezierSpline }
            }

        }

        Rectangle {
            id: buttonRect

            width: parent.width; height: parent.height * 0.12
            anchors.bottom: parent.bottom
           //anchors.bottomMargin: parent * 0.03

            color: parent.color

            CustomButton {
                id: addButton

                width: parent.width * 0.35; height: leftPart.height * 0.06
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottomMargin: leftPart.height * 0.03

                label: "Add"

                onClicked: {
                    fillPopup.open()
                }
            }
        }


        Popup {
            id: fillPopup

            width: parent.width * 0.7
            height: parent.height * 0.35

            anchors.centerIn: parent

            modal: true

            padding: 20

            background: Rectangle {
                width: parent.width
                height: parent.height

                anchors.fill: parent

                color: leftPart.color

                radius: 5 * height * 0.04

                border.width: 2
                border.color: "#67d3a9"
            }

            contentItem: Rectangle {
                width: parent.width
                height: parent.height

                color: leftPart.color

                CustomFieldRect {
                    id: fillData
                    firstField.anchors.topMargin: 0

                    color: leftPart.color

                    height: parent.height * 0.7

                    firstField.placeHolder: "Name"
                    secondField.placeHolder: "Date"
                    thirdField.placeHolder: "Description"

                }

                CustomButton {
                    width: parent.width * 0.4
                    height: parent.height * 0.6 / 3

                    anchors.horizontalCenter: parent.horizontalCenter

                    label: "Done"



                    onClicked: {
                        if(fillData.firstField.getText.length != 0 && fillData.secondField.getText.length != 0 &&
                                fillData.thirdField.getText !== 0) {
                            ToDoListModel.addTodo(fillData.firstField.acceptedText, fillData.secondField.acceptedText, fillData.thirdField.acceptedText)
                        }
                        fillData.firstField.acceptedText = ""
                        fillData.secondField.acceptedText = ""
                        fillData.thirdField.acceptedText = ""
                        fillPopup.close()
                    }
                }

            }


            closePolicy: Popup.CloseOnPressOutside | Popup.CloseOnEscape
        }

    }


    BgRect {
        id: rightPart
        anchors.right: parent.right
        Loader {
            id: rightPartLoader

            anchors.fill: parent

            source: ""
        }

        Connections {
            target: list
            function onEditData() {
                rightPartLoader.source = "CustomEditPart.qml"
            }
        }
        Connections {
            target: rightPartLoader.item
            function onSaveData() {
                rightPartLoader.source = "BgRect.qml"
            }
        }


    }
}
