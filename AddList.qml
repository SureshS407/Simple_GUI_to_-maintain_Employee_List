import QtQuick 2.6
import QtQuick.Controls 2.1
import QtQuick.Window 2.1
import QtGraphicalEffects 1.0
import SortFilterProxyModel 0.2
import QtQuick.Layouts 1.1

Item{
    id:addlist
    visible: true
EmpList{
id:elist
visible:false
}
 Column{
    x:180
    y:100
    spacing:75
     TextField{
         id:ename
        width:250
        height:40
        background: Rectangle{
            radius: 5
            border.color: "#03a9f4"
            border.width: 2
        }
     }
     TextField{
         id:eid
         width:250
         height:40
         background: Rectangle{
                   radius: 5
                   border.color: "#03a9f4"
                   border.width: 2
         }
     }
     TextField{
         id:edoj
         width:250
         height:40
         background: Rectangle{
             radius: 5
             border.color: "#03a9f4"
             border.width: 2
         }
     }
 }
 Row{
     x:150
     anchors.bottom: parent.bottom
     anchors.bottomMargin: 30
     spacing:130
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
        onClicked: {
         //here I need to write the append function..!  
       elist.namemodelalias.append({"employee_name":ename.text,"employee_ID":eid.text,"DOJ":edoj.text})
        }
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
         text:"Cancel"
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
         onClicked:{stackview.pop()}


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
 Column{
     x:190
     y:75
      spacing:100
     Label{
         text:"Employee Name"
         //font.bold: true
         font.pointSize: 10
         }
     Label{
         text:"Employee ID"
          font.pointSize: 10
     }
     Label{
         text:"Date of Joining"
          font.pointSize: 10
     }
 }

}
