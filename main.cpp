#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QWindow>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

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

    return app.exec();
}
