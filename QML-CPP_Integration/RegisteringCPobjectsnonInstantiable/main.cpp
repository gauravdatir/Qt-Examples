#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <message.h>
#include <calenderclass.h>


int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;


    // instantiable object type
    qmlRegisterType<Message>("org.qmlExample",1,0,"Message");

    // non instantiable object type
   // qmlRegisterAnonymousType<Bar>("org.qmlExample",1);

    qmlRegisterUncreatableType<CalenderClass>("org.qmlExample",1,0,
                                    "CalenderClass",
                                    "Cannot create a class of type CalenderClass");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));



    return app.exec();
}
