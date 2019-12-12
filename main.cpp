#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QWindow>
#include <QQuickView>

#include <osc_receiver.h> // oscpack
#include <osc_sender.h> // oscpack


int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<OSCReceiver>("OSC", 1, 0, "OSCReceiver"); // oscpack
    qmlRegisterType<OSCSender>("OSC", 1, 0, "OSCSender");     // oscpack

    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/main.qml"));

    // Register QML Singletons
    //qmlRegisterSingletonType(QUrl("qrc:///singletons/GlobalProperties.qml"), "GlobalProperties", 1, 0, "GlobalProperties");
    //qmlRegisterSingletonType(QUrl("qrc:///singletons/GlobalSounds.qml"), "GlobalSounds", 1, 0, "GlobalSounds");
    // *** NOTE: registering in qmldir instead ***

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.load(url);
/*
 * This is the code (already adapted) used from the qtvirtualkeyboard example
 * Need to figure out how to modify this for my project
 *
    QQuickView view(QString("qrc:///components/Basic.qml"));
    if (view.status() == QQuickView::Error)
        return -1;
    view.setResizeMode(QQuickView::SizeRootObjectToView);

    view.show();
*/
    return app.exec();
}
