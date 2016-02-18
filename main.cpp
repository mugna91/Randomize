#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include <QDesktopServices>
#include <QUrl>

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QmlApplicationViewer viewer;
    viewer.setMainQmlFile(QLatin1String("qml/Randomize/main.qml"));
    viewer.showExpanded();

    return app->exec();
}
