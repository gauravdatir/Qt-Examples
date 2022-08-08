#include <QGuiApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>

#include <message.h>

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);


    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    Message *msg = new Message();
    msg->init();
    engine.rootContext()->setContextProperty("msg", msg);



    engine.load(url);

    return app.exec();
}
