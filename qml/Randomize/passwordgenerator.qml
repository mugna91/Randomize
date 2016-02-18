import QtQuick 1.1
import com.nokia.symbian 1.1
import com.nokia.extras 1.1

Page{
    orientationLock: PageOrientation.LockPortrait
    anchors.fill: parent
    Flickable {
        id: flickArea
        anchors.top: statusBar.bottom;
        anchors.bottom: toolBar.top;
        anchors.left: parent.left;
        anchors.right: parent.right
        contentWidth: parent.width; contentHeight: colonna.height
        flickableDirection: Flickable.VerticalFlick
        clip: true
        Column{
            spacing: 3;
            id:colonna;
            anchors.right: parent.right
            anchors.left: parent.left
            Text {
                id: titleText
                width: colonna.width
                wrapMode: Text.WordWrap
                text: "<center><b>Pwd Generator</b></center>"
                font.pixelSize: 45
                color: "white"
            }
            CheckBox {
                id: checkboxString
                anchors.top: parent.titleText
                Text {
                    id: textString
                    x: 99
                    y: 6
                    width: 261
                    height: 22
                    anchors.right: parent.right
                    wrapMode: Text.WordWrap
                    text: "String (a,b,c...)"
                    anchors.rightMargin: -294
                    color: "white"
                }
            }
            CheckBox {
                id: checkboxCapital
                Text {
                    id: textCapital
                    x: 99
                    y: 6
                    width: 260
                    height: 22
                    anchors.right: parent.right
                    wrapMode: Text.WordWrap
                    text: "Capital (A,B,C...)"
                    anchors.rightMargin: -294
                    color: "white"
                }
            }
            CheckBox {
                id: checkboxDigits
                Text {
                    id: textDigits
                    x: 99
                    y: 6
                    width: 260
                    height: 22
                    anchors.right: parent.right
                    wrapMode: Text.WordWrap
                    text: "Digits (1,2,3...)"
                    anchors.rightMargin: -294
                    color: "white"
                }
            }
            CheckBox {
                id: checkboxSpecial
                Text {
                    id: textSpecial
                    x: 99
                    y: 6
                    width: 260
                    height: 22
                    anchors.right: parent.right
                    wrapMode: Text.WordWrap
                    text: "Special (!,%,$...)"
                    anchors.rightMargin: -294
                    color: "white"
                }
            }
            Text {
                id: text2
                text: "Length:"
                color:"white"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.checkboxSpecial
            }
            TextField {
                id: numLength
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.top: parent.text2
                placeholderText: "Password length"
                width: 260
            }
            Text {
            id: output
            color: "#ffffffff"
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: parent.numMax
            font.pixelSize: 50-(text.length*10)
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            horizontalAlignment: "AlignHCenter"
            verticalAlignment: "AlignBottom"
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
            Button {
                text: "Randomize"
                onClicked: {
                    var c = parseInt(numLength.text);
                    if (c>1000) {
                        output.text="Error! Password too long!";
                        c=1;
                        numLength.text='1';
                        return;
                    }
                    var out='';
                    var numeri=['0','1','2','3','4','5','6','7','8','9'] //4 array contenenti tutti i char
                    var minuscole=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
                    var maiuscole=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
                    var speciali=['!','$','%','&','/','=','?','^','@','-','_','€','+','#','*'];
                    var risult=new Array(); //array che serve per concatenare gli altri
                    if (checkboxString.checked) { //verifica delle checkbox
                        risult=risult.concat(minuscole); //concatena l'array minuscole e lo inserisce nell'array result
                    }
                    if (checkboxCapital.checked) {
                        risult=risult.concat(maiuscole);
                    }
                    if (checkboxDigits.checked) {
                        risult=risult.concat(numeri);
                        risult=risult.concat(numeri); //aumenta le possibilità di estrarre numeri
                    }
                    if (checkboxSpecial.checked) {//di default l'if guarda se è =true quindi non serve
                        risult=risult.concat(speciali);
                    }
                    for(var i=0;i<c;i++)
                    {
                        out+=risult[Math.floor(Math.random()*risult.length)]; //fa il random di risult e lo mette su out
                    }
                    output.text=out; //print di out su output
                }
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
