import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.1

ApplicationWindow {
    id: mainWinow
    width: 900
    height: 500
    visible: true
    title: qsTr("HydrologistHandbook")

    TableView {
            id: tableView
            anchors.fill: parent
            anchors.margins: 10
            clip: true


       model: ListModel {
            id: riverList

            ListElement { Id: "1"; name: "Волга"; lenght: "3530"; fallsIn: "Каспийское море"; annualRunoff: "254";
            coolArea: "1360000"}

            ListElement { Id: "2"; name: "Енисей"; lenght: "3487"; fallsIn: "Енисейский залив"; annualRunoff: "624,41"
            coolArea: "2580000"}

            ListElement { Id: "3"; name: "Лена"; lenght: "4480"; fallsIn: "Море Лаптевых"; annualRunoff: "516,6"
            coolArea: "2490000"}

        }

          Row {
            id: hedder
            spacing: 1
            function itemAt(index) {
                return repeater.itemAt(index)
            }

            Repeater {
                id: repeater
                model: ["Id", "Название реки", "Протяженность ", "Впадает в", "Годовой сток ", "Площадь бассейна"]
                Label {
                    text: modelData
                    color: "#FFDB8B"
                    font.bold: true
                    font.pixelSize: 20
                    padding: 10
                    background: Rectangle { color: "#7851A9" }
                    Rectangle {
                        color: "black"
                        width: parent.width
                        height: 2
                    }
                    Rectangle {
                        color: "black"
                        width: 2
                        height: parent.height
                    }
                }
            }
        }

        delegate: Column {
            id: delegate
            property int row: index
            Row {
                spacing: 1
                Repeater {
                    model: 1
                    ItemDelegate {
                        property int column: index
                        font.pixelSize: 15
                        text:  qsTr("%1").arg(riverList.get(delegate.row).Id)
                        width: hedder.itemAt(column).width
                        y: 40
                        Rectangle {
                            color: "black"
                            width: parent.width
                            height: 2
                        }
                        Rectangle {
                            color: "black"
                            width: 2
                            height: parent.height
                        }
                    }
                }
                Repeater {
                    model: 1
                    ItemDelegate {
                        property int column: index + 1
                        font.pixelSize: 15
                        text:  qsTr("%1").arg(riverList.get(delegate.row).name)
                        width: hedder.itemAt(column).width
                        y: 40
                        Rectangle {
                            color: "black"
                            width: parent.width
                            height: 2
                        }
                        Rectangle {
                            color: "black"
                            width: 2
                            height: parent.height
                        }
                    }
                }
                Repeater {
                    model: 1
                    ItemDelegate {
                        property int column: index + 2
                        font.pixelSize: 15
                        text:  qsTr("%1").arg(riverList.get(delegate.row).lenght)
                        width: hedder.itemAt(column).width
                        y: 40
                        Rectangle {
                            color: "black"
                            width: parent.width
                            height: 2
                        }
                        Rectangle {
                            color: "black"
                            width: 2
                            height: parent.height
                        }
                    }
                }
                Repeater {
                    model: 1
                     ItemDelegate {
                        property int column: index + 3
                        font.pixelSize: 15
                        text:  qsTr("%1").arg(riverList.get(delegate.row).fallsIn)
                        width: hedder.itemAt(column).width
                        y: 40
                        Rectangle {
                            color: "black"
                            width: parent.width
                            height: 2
                        }
                        Rectangle {
                            color: "black"
                            width: 2
                            height: parent.height
                        }
                    }
                }
                Repeater {
                    model: 1
                    ItemDelegate {
                        property int column: index + 4
                        font.pixelSize: 15
                        text:  qsTr("%1").arg(riverList.get(delegate.row).annualRunoff)
                        width: hedder.itemAt(column).width
                        y: 40
                        Rectangle {
                            color: "black"
                            width: parent.width
                            height: 2
                        }
                        Rectangle {
                            color: "black"
                            width: 2
                            height: parent.height
                        }
                    }
                }
                Repeater {
                    model: 1
                    ItemDelegate {
                        property int column: index + 5
                        font.pixelSize: 15
                        text:  qsTr("%1").arg(riverList.get(delegate.row).coolArea)
                        width: hedder.itemAt(column).width
                        y: 40
                        Rectangle {
                            color: "black"
                            width: parent.width
                            height: 2
                        }
                        Rectangle {
                            color: "black"
                            width: 2
                            height: parent.height
                        }
                    }
                }
            }
        }

         Rectangle {
             x: 873
             color: "black"
             width: 2
             height: parent.height + 42
         }

        ScrollIndicator.horizontal: ScrollIndicator { }
        ScrollIndicator.vertical: ScrollIndicator { }
      }

    Button {
        id: buttonAdd
        y: mainWinow.height - 50
        x: 10
        text: qsTr("Добавить")

        contentItem: Text {
                    text: buttonAdd.text
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 10
                    font.bold: true
                    color: "#FFDB8B"
                }
                background: Rectangle {
                    implicitWidth: 150
                    implicitHeight: 30
                    color: "#7851A9"
                    radius: 10
                    border.width: 2.0
                    border.color: "#000000"
                }

        onClicked: {
            addWindow.show()
        }
    }
    Button {
        id: buttonDelete
        y: mainWinow.height - 50
        x: 734
        text: qsTr("Удалить")

        contentItem: Text {
                    text: buttonDelete.text
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 10
                    font.bold: true
                    color: "#FFDB8B"
                }
                background: Rectangle {
                    implicitWidth: 150
                    implicitHeight: 30
                    color: "#7851A9"
                    radius: 10
                    border.width: 2.0
                    border.color: "#000000"
                }

        onClicked: {
            riverList.remove(0)
        }
    }

    Button {
        id: buttonRiver
        y: mainWinow.height - 50
        x: 370
        text: qsTr("Количество рек")

        contentItem: Text {
                    text: buttonRiver.text
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 10
                    font.bold: true
                    color: "#FFDB8B"
                }
                background: Rectangle {
                    implicitWidth: 150
                    implicitHeight: 30
                    color: "#7851A9"
                    radius: 10
                    border.width: 2.0
                    border.color: "#000000"
                }

        onClicked: {
            riverWindow.show()
        }
    }

    Window {
            id: addWindow
            width: 200
            height: 300

            title: qsTr("Добавить реку")


            TextField {
                id: id
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 10
                font.pixelSize: 20
                placeholderText: qsTr("Id")

            }
            TextField {
                id: name
                anchors.top: id.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 10
                 font.pixelSize: 20
                placeholderText: qsTr("Name")

            }
            TextField {
                id: lenght
                anchors.top: name.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 10
                font.pixelSize: 20
                placeholderText: qsTr("Lenght")

            }
            TextField {
                id: fallsIn
                anchors.top: lenght.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 10
                font.pixelSize: 20
                placeholderText: qsTr("FallsIn")

            }
            TextField {
                id: annualRunoff
                anchors.top: fallsIn.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 10
                font.pixelSize: 20
                placeholderText: qsTr("AnnualRunoff")

            }
            TextField {
                id: coolArea
                anchors.top: annualRunoff.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 10
                font.pixelSize: 20
                placeholderText: qsTr("CoolArea")

            }


            Button {
                id: buttonAccept
                text: qsTr("Добавить")
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 10

                contentItem: Text {
                            text: buttonAccept.text
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font.pointSize: 10
                            font.bold: true
                            color: "#FFDB8B"
                        }
                        background: Rectangle {
                            implicitWidth: 150
                            implicitHeight: 30
                            color: "#7851A9"
                            radius: 10
                            border.width: 2.0
                            border.color: "#000000"
                        }

                onClicked: {
                      riverList.append({ Id: id.text, name: name.text, lenght: lenght.text, fallsIn: fallsIn.text, annualRunoff: annualRunoff.text, coolArea: coolArea.text})
                      mainWinow.show()
                      addWindow.hide()
                }
            }
        }

    Window {
            id: riverWindow
            width: 200
            height: 300
            title: qsTr("Количество рек")

            TextField {
                id: kolvoRiverTextField
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 10
                font.pixelSize: 12
                placeholderText: qsTr("Введите площадь бассйна")

            }


            TextField {
                id: riversTextField
                anchors.top: kolvoRiverTextField.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 10
                font.pixelSize: 12
            }

            Button {
                id: buttonKolVo
                text: qsTr("Расчитать")
                anchors.bottom: parent.bottom
                width: 95
                anchors.right: buttonExit.left
                anchors.left: parent.left
                anchors.margins: 10

                contentItem: Text {
                            text: buttonKolVo.text
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font.pointSize: 10
                            font.bold: true
                            color: "#FFDB8B"
                        }
                        background: Rectangle {
                            implicitWidth: 150
                            implicitHeight: 30
                            color: "#7851A9"
                            radius: 10
                            border.width: 2.0
                            border.color: "#000000"
                        }

                onClicked: {
                    var river =0
                    for(var i =0; i < riverList.count; i++)
                    {
                        var ri = parseInt(kolvoRiverTextField.text)
                        if(parseInt(riverList.get(i).coolArea) > parseInt(kolvoRiverTextField.text))
                        {
                            river ++
                        }
                    }
                    riversTextField.text = river.toString()
                }
            }
            Button {
                id: buttonExit
                text: qsTr("Выйти")
                anchors.bottom: parent.bottom
                anchors.left: buttonKolVo.right
                anchors.right: parent.right
                anchors.margins: 10

                contentItem: Text {
                            text: buttonExit.text
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font.pointSize: 10
                            font.bold: true
                            color: "#FFDB8B"
                        }
                        background: Rectangle {
                            implicitWidth: 150
                            implicitHeight: 30
                            color: "#7851A9"
                            radius: 10
                            border.width: 2.0
                            border.color: "#000000"
                        }

                onClicked: {
                      mainWinow.show()
                      riverWindow.hide()
                }
            }
    }
}
