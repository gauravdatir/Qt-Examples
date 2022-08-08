#include "myclass.h"
#include <QEvent>
#include <QKeyEvent>

MyClass::MyClass()
{

}

void MyClass::cppSlot(const QString &msg) {
    qDebug() << "Called the C++ slot with message:" << msg;
}

void MyClass::installEventFilterLoc(QObject *obj)
{
    this->installEventFilter(obj);
}

bool MyClass::eventFilter(QObject* object, QEvent* event) {
    if (event->type() == QEvent::KeyPress) {
        QKeyEvent *ke = static_cast<QKeyEvent *>(event);
        if (ke->key() == Qt::Key_Tab) {
            // special tab handling here
            return true;
        }
    }
   // return QWidget::event(event);
}
