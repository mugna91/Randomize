import QtQuick 1.1
import com.nokia.symbian 1.1
import com.nokia.extras 1.1


Page{
    orientationLock: PageOrientation.LockPortrait
    anchors.fill: parent;
    Flickable {
        id: flickArea
        anchors.top: statusBar.bottom
        anchors.bottom: toolBar.top
        anchors.left: parent.left
        anchors.right: parent.right
        contentWidth: parent.width
        flickableDirection: Flickable.VerticalFlick
        clip: true
        Column{
            id:colonna
            spacing: 10;
            anchors.top: parent.top
            anchors.left: parent.left;
            anchors.right: parent.right
            anchors.topMargin: 20;
            anchors.verticalCenter: parent.verticalCenter
            Text{
                text:"Randomize 1.1";
                color:"white"
                horizontalAlignment: Text.AlignHCenter;
                anchors.left: parent.left;
                anchors.right: parent.right
                font.pixelSize: 40;
                wrapMode: Text.WordWrap
            }
            Image {
                width: 250; height: 250
                smooth: true
                source: "logo.png"
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Text {
                id: aboutText
                width: colonna.width
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter;
                color: "white"
                text: "Developed by Mugna91"
                wrapMode: Text.WordWrap
                onLinkActivated: { Qt.openUrlExternally(link); }
            }
            Text {
                text: "mugna.nokia@gmail.com"
                color: "#0000FF"
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter;
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        Qt.openUrlExternally("mailto:mugna.nokia@gmail.com")
                    }
                }
            }
            Text {
                id: aboutText2
                width: colonna.width
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter;
                color: "white"
                text: "Special thanks to Andrea993"
                wrapMode: Text.WordWrap
            }
    }
}
    ToolBar {
        id: toolBar
        anchors.bottom: parent.bottom
        tools: ToolBarLayout {
            id: toolBarLayout
            ToolButton {
                flat: true
                iconSource: "toolbar-back.png"
                onClicked: window.pageStack.depth <= 1 ? Qt.quit() : window.pageStack.pop()
            }
        }
    }
    StatusBar {
        id: statusBar
        Label {
            text: "Randomize"
        }
    }
}
