import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts

Variants {
    model: Quickshell.screens
    FloatingWindow {
        property var modelData
        screen: modelData
        visible: true
        width: 400
        height: 800

        color: "transparent"

        Rectangle {
            anchors.fill: parent
            color: "#80000000"

            MouseArea {
                anchors.fill: parent
                onClicked: visible = false
            }
        }

        Rectangle {
            anchors.fill: parent
            color: "#1a1b26"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 15

                RowLayout {
                    Layout.fillWidth: true

                    Text {
                        text: "Dashboard"
                        color: "#a9b1d6"
                        font.pixelSize: 24
                        font.family: "JetBrainsMono Nerd Font"
                        font.bold: true
                    }

                    Item { Layout.fillWidth: true }

                    Rectangle {
                        width: 30
                        height: 30
                        color: "#32344a"
                        radius: 5

                        Text {
                            anchors.centerIn: parent
                            text: "✕"
                            color: "#a9b1d6"
                            font.pixelSize: 18
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: visible = false
                        }
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 200
                    color: "#16161e"
                    radius: 8

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 15
                        spacing: 10

                        Text {
                            text: "System Stats"
                            color: "#7aa2f7"
                            font.pixelSize: 16
                            font.family: "JetBrainsMono Nerd Font"
                            font.bold: true
                        }

                        RowLayout {
                            Layout.fillWidth: true

                            Text {
                                text: "CPU"
                                color: "#a9b1d6"
                                font.pixelSize: 14
                                font.family: "JetBrainsMono Nerd Font"
                                Layout.preferredWidth: 80
                            }

                            Rectangle {
                                Layout.fillWidth: true
                                height: 20
                                color: "#32344a"
                                radius: 4

                                Rectangle {
                                    width: parent.width * 0.45
                                    height: parent.height
                                    color: "#e0af68"
                                    radius: 4
                                }
                            }

                            Text {
                                text: "45%"
                                color: "#a9b1d6"
                                font.pixelSize: 14
                                font.family: "JetBrainsMono Nerd Font"
                                Layout.preferredWidth: 50
                            }
                        }

                        RowLayout {
                            Layout.fillWidth: true

                            Text {
                                text: "Memory"
                                color: "#a9b1d6"
                                font.pixelSize: 14
                                font.family: "JetBrainsMono Nerd Font"
                                Layout.preferredWidth: 80
                            }

                            Rectangle {
                                Layout.fillWidth: true
                                height: 20
                                color: "#32344a"
                                radius: 4

                                Rectangle {
                                    width: parent.width * 0.62
                                    height: parent.height
                                    color: "#9ece6a"
                                    radius: 4
                                }
                            }

                            Text {
                                text: "62%"
                                color: "#a9b1d6"
                                font.pixelSize: 14
                                font.family: "JetBrainsMono Nerd Font"
                                Layout.preferredWidth: 50
                            }
                        }

                        RowLayout {
                            Layout.fillWidth: true

                            Text {
                                text: "Disk"
                                color: "#a9b1d6"
                                font.pixelSize: 14
                                font.family: "JetBrainsMono Nerd Font"
                                Layout.preferredWidth: 80
                            }

                            Rectangle {
                                Layout.fillWidth: true
                                height: 20
                                color: "#32344a"
                                radius: 4

                                Rectangle {
                                    width: parent.width * 0.73
                                    height: parent.height
                                    color: "#7aa2f7"
                                    radius: 4
                                }
                            }

                            Text {
                                text: "73%"
                                color: "#a9b1d6"
                                font.pixelSize: 14
                                font.family: "JetBrainsMono Nerd Font"
                                Layout.preferredWidth: 50
                            }
                        }
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 120
                    color: "#16161e"
                    radius: 8

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 15
                        spacing: 10

                        Text {
                            text: "Quick Controls"
                            color: "#7aa2f7"
                            font.pixelSize: 16
                            font.family: "JetBrainsMono Nerd Font"
                            font.bold: true
                        }

                        RowLayout {
                            Layout.fillWidth: true

                            Text {
                                text: "🔊"
                                font.pixelSize: 20
                            }

                            Rectangle {
                                Layout.fillWidth: true
                                height: 8
                                color: "#32344a"
                                radius: 4

                                Rectangle {
                                    width: parent.width * 0.7
                                    height: parent.height
                                    color: "#ad8ee6"
                                    radius: 4
                                }
                            }

                            Text {
                                text: "70%"
                                color: "#a9b1d6"
                                font.pixelSize: 14
                                font.family: "JetBrainsMono Nerd Font"
                            }
                        }

                        RowLayout {
                            Layout.fillWidth: true

                            Text {
                                text: "☀️"
                                font.pixelSize: 20
                            }

                            Rectangle {
                                Layout.fillWidth: true
                                height: 8
                                color: "#32344a"
                                radius: 4

                                Rectangle {
                                    width: parent.width * 0.85
                                    height: parent.height
                                    color: "#e0af68"
                                    radius: 4
                                }
                            }

                            Text {
                                text: "85%"
                                color: "#a9b1d6"
                                font.pixelSize: 14
                                font.family: "JetBrainsMono Nerd Font"
                            }
                        }
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 100
                    color: "#16161e"
                    radius: 8

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 15
                        spacing: 5

                        Text {
                            text: Qt.formatDateTime(new Date(), "dddd, MMMM d")
                            color: "#0db9d7"
                            font.pixelSize: 18
                            font.family: "JetBrainsMono Nerd Font"
                            font.bold: true
                        }

                        Text {
                            text: Qt.formatDateTime(new Date(), "h:mm AP")
                            color: "#a9b1d6"
                            font.pixelSize: 28
                            font.family: "JetBrainsMono Nerd Font"
                            font.bold: true
                        }
                    }
                }

                Item { Layout.fillHeight: true }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 10

                    Rectangle {
                        Layout.fillWidth: true
                        height: 40
                        color: "#32344a"
                        radius: 8

                        Text {
                            anchors.centerIn: parent
                            text: "Lock"
                            color: "#a9b1d6"
                            font.pixelSize: 14
                            font.family: "JetBrainsMono Nerd Font"
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                            }
                        }
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 40
                        color: "#f7768e"
                        radius: 8

                        Text {
                            anchors.centerIn: parent
                            text: "Power"
                            color: "#1a1b26"
                            font.pixelSize: 14
                            font.family: "JetBrainsMono Nerd Font"
                            font.bold: true
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                            }
                        }
                    }
                }
            }
        }
    }
}
