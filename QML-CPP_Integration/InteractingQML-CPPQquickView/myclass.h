#ifndef MYCLASS_H
#define MYCLASS_H

#include <QObject>
#include <QDebug>

class MyClass : public QObject
{
    Q_OBJECT
public:
    MyClass();
    void installEventFilterLoc(QObject *);
    bool eventFilter(QObject* object, QEvent* event);
public slots:
    void cppSlot(const QString &msg);
};
#endif // MYCLASS_H
