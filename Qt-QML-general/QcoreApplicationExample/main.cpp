#include <QCoreApplication>
#include <QDebug>

int main(int argc, char *argv[])
{
    QCoreApplication exampleApp(argc, argv);

    qDebug() << "This is Qt core application without GUI";
    qDebug() << "Application name: " << QCoreApplication::applicationName();
    qDebug() << "Application version: " << QCoreApplication::applicationVersion();
    qDebug() << "Application directory path: " << QCoreApplication::applicationDirPath();
    qDebug() << "Application file path: " << QCoreApplication::applicationFilePath();
    qDebug() << "Application PID: " << QCoreApplication::applicationPid();
    qDebug() << "Application lib paths: " << QCoreApplication::libraryPaths();
    exampleApp.setApplicationVersion("1.0.1");
    qDebug() << "New Application version: " << QCoreApplication::applicationVersion();


   return exampleApp.exec();
}
