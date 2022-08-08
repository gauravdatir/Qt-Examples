#include <QObject>
#include <QQuickItem>
#include <QQuickWindow>
#include <QQmlComponent>
#include <QQmlProperties>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <myclass.h>

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    // /*
    QQmlApplicationEngine  engine;
    engine.load(QUrl(QStringLiteral("qrc:/mainWindow.qml")));
    QQmlComponent component(&engine,QUrl(QStringLiteral("qrc:/qmlComp.qml")));

    QQuickWindow *window = qobject_cast<QQuickWindow*>(engine.rootObjects().at(0));
    if (!window) {
        qFatal("Error: Your root item has to be a window.");
        return -1;
    }
    window->show();
    QQuickItem *root = window->contentItem();

    QQuickItem *object = qobject_cast<QQuickItem*>(component.create());
    QQmlEngine::setObjectOwnership(object, QQmlEngine::CppOwnership);

    object->setParentItem(root);  // visual parrent
    object->setParent(&engine);   // object tree parent



    object->setProperty("width", 300);
    int width = object->width();
    object->setProperty("height",width);
    object->setProperty("width", 800);



   // QQmlProperty(object, "width").write(500);   // breaks binding


    // Accessing Loaded QML Objects by Object Name
    QObject *rect = object->findChild<QObject*>("rect");   // using object name
    if (rect)
        rect->setProperty("color", "red");


    //QQuickItem *item = qobject_cast<QQuickItem*>(object);
    // item->setHeight(500);

    // QQmlProperty(object, "width").write(500);   // breaks binding

    qDebug() << "Property value:" << QQmlProperty::read(object, "stateNumber").toInt();
    QQmlProperty::write(object, "refWidth", 900);

    qDebug() << "Property value refwidth after write:" << QQmlProperty::read(object, "refWidth").toInt();

   // object->setProperty("refWidth", 900);

    QString returnedValue;
    QString msg = "Hello from C++";
    QMetaObject::invokeMethod(object, "myQmlFunction",
                              Q_RETURN_ARG(QString, returnedValue),
                              Q_ARG(QString, msg));
    qDebug() << "QML function returned:" << returnedValue;

    MyClass myClass;
    QObject::connect(object, SIGNAL(qmlSignal(QString)),
                         &myClass, SLOT(cppSlot(QString)));


    return app.exec();
}
