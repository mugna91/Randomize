import QtQuick 1.1
import com.nokia.symbian 1.1
import com.nokia.extras 1.1


PageStackWindow {
    id: window
    initialPage: MainPage {tools: toolBarLayout}
    showStatusBar: false
    showToolBar: false
    ToolBarLayout {
        id: toolBarLayout
    }
}
