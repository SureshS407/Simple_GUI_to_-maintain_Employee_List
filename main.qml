import QtQuick 2.6
import QtQuick.Controls 2.1
import QtQuick.Window 2.1
import QtGraphicalEffects 1.0

ApplicationWindow {
    id:root
    visible: true
    width: 600
    height: 480
    flags: Qt.Window | Qt.FramelessWindowHint//to create framelesswindow
    color: "#add8e6"
 Rectangle{
     id:frame1
     width: 600
     height: 480
     color: "#add8e6"
     border.color: "#03a9f4" // to set window border color
 }
 Text{
     text:"All is well0"
 }

 Loader{
     id:mainloader
     anchors.fill:parent
     source: "manage.qml"
 }
}

