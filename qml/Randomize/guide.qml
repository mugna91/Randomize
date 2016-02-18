import QtQuick 1.1
import com.nokia.symbian 1.1
import com.nokia.extras 1.1


Page{
    orientationLock: PageOrientation.LockPortrait
    anchors.fill: parent;
    Flickable {
        id: flickArea
        anchors.top: statusBar.bottom;
        anchors.bottom: toolBar.top;
        anchors.left: parent.left;
        anchors.right: parent.right
        contentWidth: parent.width; contentHeight: colonna.height
        flickableDirection: Flickable.VerticalFlick
        clip: true
        Column {
            spacing: 3;
            id:colonna;
            anchors.right: parent.right
            anchors.left: parent.left
            Text {
                id: guida
                width: colonna.width
                wrapMode: Text.WordWrap
                text: "<center><b><h1>Guide</h1></b></center>" +
                      "The 'Random Generator' page let you create a set of random numbers. " +
                      "For do that, just set minimum, maximum and quantity value and press 'Randomize' button. " +
                      "This operation will create n random numbers between min and max value. " +
                      "Press the 'Unique' checkbox for show only unique numbers, without duplicates. " +
                      "The 'Password Generator' page instead, let you create a random password that contains only " +
                      "the characters you have chosen from checkboxes on top. " +
                      "You can choose Strings, Capital, Numbers and/or Special characters. " +
                      "After that, you need to insert (in number) the length of your password, and press 'Randomize' " +
                      "button to generate your password. " +
                      "That's it! If you have problems using my application please do not hesitate to contact me."
                color: "white"
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
