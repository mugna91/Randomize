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
                text: "<center><b><h1>Random Generator</h1></b></center>"
                color: "white"
            }
            Text {
                id: textFrom
                text: "From:"
                color: "white"
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.top: parent.titleText
            }
            TextField {
                id: numMin
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.top: parent.textFrom
                placeholderText: "Select minimum number"
                width: 260
            }
            Text {
                id: textTo
                text: "To:"
                color: "white"
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.top: parent.numMin
                anchors.bottom: parent.numMax
            }
            TextField {
                id: numMax
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.top: parent.textTo
                placeholderText: "Select maximum number"
                width: 260
            }
            Text {
                id: textQuantity
                text: "Quantity:"
                color: "white"
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.top: parent.numMax
            }
            TextField {
                id: numQuantity
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.top: parent.textQuantity
                placeholderText: "Select quantity"
                width: 260
            }
            CheckBox {
                id: checkboxUnique
                Text {
                    id: textString
                    x: 45
                    y: 5
                    width: 77
                    height: 22
                    anchors.right: parent.right
                    wrapMode: Text.WordWrap
                    text: "Unique"
                    anchors.rightMargin: -80
                    color: "white"
                }
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
                iconSource: "close.png"
                onClicked: Qt.quit();
            }
            Button {
                text: "Randomize"
                onClicked: {
                    function isUnique(vettore,n)
                    {
                        for (var i=0;i<vettore.length;i++)
                           {
                            if(vettore[i]===n)
                                return false;
                           }
                        return true;
                    }
                    var a = parseInt(numMin.text); //legge a=min
                    if(isNaN(a))
                    {
                        a=0;
                        numMin.text='0';
                    }
                    var b = parseInt(numMax.text); //legge b=max
                    if(isNaN(b))
                    {
                        b=0;
                        numMax.text="10";
                        numQuantity.text="1";
                        output.text='Error! Select Maximum Number!';
                        return;
                    }
                    var c = parseInt(numQuantity.text); //legge c=quant;
                    if(isNaN(c))
                    {
                        c=1;
                        numQuantity.text='1';
                    }
                    if(a>=b) {
                        output.text='Impossible!';
                        b=10;
                        numMax.text='10';
                        a=0;
                        numMin.text='0';
                        c=1;
                        numQuantity.text='1';
                        return;
                    }
                    if(c>1000) {
                        output.text='Error! Quantity must be < 1000';
                        c=1;
                        numQuantity.text='1';
                        return;
                    }
                    var ris=''; //ris è una stringa perchè tra apici ma inizialmente vuota
                    if (checkboxUnique.checked==false) {
                    for (var i=0;i<c;i++) //esegue c volte il codice sotto (c= n numeri da estrarre)
                    {
                        ris+=Math.floor(Math.random()*(b-a+1)+a)+'-'; //+= significa ris=ris+....
                                                                      // il + nelle stringhe le concatena
                                                                      // per cui aggiunge a ris un numero casuale + ',' una virgola
                    }
                    ris=ris.substring(0,ris.length-1); //ris=ris a parte l'ultimo carattere (una virgola in più)

                    output.text=ris; //fa output di ris
                    }
                    else {
                        if (c>b-a+1){
                            output.text='Impossible!';
                            return;
                        }
                        var out='';
                        var array= new Array();
                        for (i=0;i<c;i++) //non usare x parti semppre usando i,j,k (il codice è più comprensibile, standard)
                        {
                            var r;
                            do
                            {
                               r=Math.floor(Math.random()*(b-a+1)+a);
                            }
                            while(!isUnique(array,r));
                            array.push(r);
                            out+=r+',';
                        }
                        out=out.substring(0,out.length-1);
                        output.text=out;
                        }
                    }
                }
            ToolButton {
                x: 300
                y: 0
                iconSource: "toolbar-menu"
                onClicked: mainMenu.open()
                Menu {
                    id: mainMenu
                    content: MenuLayout {
                        MenuItem {
                            text: "Password Generator"
                            onClicked: pageStack.push(Qt.resolvedUrl("passwordgenerator.qml"));
                        }
                        MenuItem {
                            text: "Guide"
                            onClicked: pageStack.push(Qt.resolvedUrl("guide.qml"));
                        }
                        MenuItem {
                            text: "About"
                            onClicked: pageStack.push(Qt.resolvedUrl ("about.qml"));
                        }
                    }
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
