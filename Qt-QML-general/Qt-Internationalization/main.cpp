#include <QGuiApplication>
#include <QTranslator>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));

    engine.load(url);

    QTranslator myappTranslator;
    QTranslator qtTranslator;
    myappTranslator.load(QString("example_") + "fr");

    qtTranslator.load(QLocale::system(), QStringLiteral("qtbase_"));
    app.installTranslator(&myappTranslator);

    return app.exec();
}
