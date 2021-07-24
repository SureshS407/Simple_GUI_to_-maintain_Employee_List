import QtQuick 2.6
import QtQuick.Controls 2.1
import QtQuick.Window 2.1
import QtGraphicalEffects 1.0
import SortFilterProxyModel 0.2
import QtQuick.Layouts 1.1

Item{
    id:emplist
    width:600
    height:480
    visible: true

 Image {
    y:6
    x:115
     source: "qrc:/Assets/Search_Emplist.png"
 }


 TextField{
     id:searchfield
     y:7
     x:200
      font.pointSize: 11
   placeholderText:("Type Here to search..")
    // text: "Type Here to search.."
      color: "#00008B"
      font.italic: true
      onEditingFinished: {
          var searchstr=searchfield.text
          console.log(searchstr)
         /* if(searchstr=="hi")
               console.log(searchstr)
          else
               console.log(searchstr+"hi")*/
         // lv.model.applyFilter(searchstr)
          var count=namemodel.count;
          console.log(count)
          for(var i=0;i<count;i++)
          {
              console.log(namemodel.get(i).employee_name)
          }


      }

           background:Rectangle{
               x:-70
               width:300

               visible: true
          color:"Transparent"
         // border.color:"#03a9f4"
      }


}
Row{
    y:50
    x:20
    spacing: 30

 Label{
     text: qsTr("Employee name")
     color:"#ffffff"
     font.pointSize: 12
     bottomPadding: 10
     topPadding: 10
     rightPadding: 10
     leftPadding: 10
        font.bold: true
     background: Rectangle{
         border.color: "#00008B"
         color:"#03a9f4"
         radius: 10
     }
 }
 Label{
     text: qsTr("Employee ID")
     color:"#ffffff"
     font.pointSize: 12
     bottomPadding: 10
     topPadding: 10
     rightPadding: 10
     leftPadding: 10
        font.bold: true
     background: Rectangle{
         border.color: "#00008B"
         color:"#03a9f4"
         radius: 10
     }
 }
 Label{
     id:doj
     text: qsTr("Date of Joining")
     color:"#ffffff"
     font.pointSize: 12
     bottomPadding: 10
     topPadding: 10
     rightPadding: 10
     leftPadding: 10
        font.bold: true
     background: Rectangle{
                 border.color: "#00008B"
                 color:"#03a9f4"
                 radius: 10
     }
 }
}

ListView{
    id:lv
    y:120
    x:20
   width:480
    height:250
    spacing: 30
  //  ColorOverlay:"white"
  // anchors.fill:parent
   model:proxymodel

//clip:true
        delegate:Rectangle{
            id:rec
            width:lv.width
            height:50
                color: "#ececec"
                border.color: "#d3d3d3"
                border.width:1

            Text{
                id:etext
                color: "#00008B"
                anchors.centerIn: rec
                font.pointSize: 10
               text:employee_name+"\t\t "+employee_ID+"\t\t "+DOJ
              Component.onCompleted:console.log("Welcome",model.index)

            }
            Component.onCompleted:console.log("Welcome",model.index)
             Button {
                  y:-3
                  x:480
              //  anchors.right: lv.right
                 id: im
                 icon.color: "Transparent"
                 icon.source: "qrc:/Assets/Remove_Emplist.png"

                   background: Rectangle{color:"transparent"}
                   onClicked: {
                       namemodel.remove(model.index,1)
                   }
             }
        }
        section {
            property: "sectionRole"
            criteria: ViewSection.FirstCharacter
            labelPositioning: ViewSection.InlineLabels | ViewSection.CurrentLabelAtStart
          //  delegate:rec
        }
}
property alias text: searchfield.displayText
SortFilterProxyModel{
   id:proxymodel
   sourceModel: namemodel
   filters: [
            AnyOf {
           RegExpFilter {
               roleName: "employee_name"
               pattern: "^" + text
               caseSensitivity: Qt.CaseInsensitive
           }
           RegExpFilter {
               roleName: "employee_ID"
               pattern: "^" + text
               caseSensitivity: Qt.CaseInsensitive
           }
       }
   ]
}

Row{
   x:30
  //  y:400
 anchors.bottom: emplist.bottom
 anchors.bottomMargin: 20
    //    anchors.centerIn: parent
    spacing:130
    visible: true
    Button{
       text:"Add"
       bottomPadding: 10
       topPadding: 10
       rightPadding:30
       leftPadding: 30
       font.pointSize: 10
        highlighted:true
        font.bold: true
       background: Rectangle{
           id:addsource
                      color: "#03a9f4"
                            }
       onClicked: {stackview.push("AddList.qml")}
       DropShadow{
           anchors.fill:parent
           radius: 5
           horizontalOffset: 3
           verticalOffset: 3
           color: "#808080"
        //   samples:15
           source: addsource
       }
}
    Button{
        icon.color: "Transparent"
        icon.source:"qrc:/Assets/Home_Screen.png"
        background: Rectangle{
            color: "Transparent"
        }
        onClicked: {
        stackview.pop("EmpList.qml")}
    }

    Button{
        text:"Exit"
        bottomPadding: 10
        topPadding: 10
        rightPadding:30
        leftPadding: 30
        font.pointSize: 10
         highlighted:true
         font.bold: true
        background: Rectangle{
            id:exitsource
                       color: "#03a9f4"
                             }
        onClicked:{
           namemodel.append({"employee_name":"Jack   ","employee_ID":" 0155","DOJ":"02-01-2019"})
        }
        DropShadow{
            anchors.fill:parent
            radius: 5
            horizontalOffset: 3
            verticalOffset: 3
            color: "#808080"
          //  samples:150
            source: exitsource
        }
    }
}
property alias namemodelalias: namemodel
ListModel{
    id:namemodel
    ListElement{employee_name:"John doe";employee_ID:"0112";DOJ:"20-07-2017"}
    ListElement{employee_name:"John Smith";employee_ID:"0125";DOJ:"15-03-2010"}
    ListElement{employee_name:"Joseph   ";employee_ID:"0155";DOJ:"02-01-2019"}
    ListElement{employee_name:"John 2";employee_ID:"0126";DOJ:"18-03-2010"}
}
}


