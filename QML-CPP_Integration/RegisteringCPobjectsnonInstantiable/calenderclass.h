#ifndef CALENDERCLASS_H
#define CALENDERCLASS_H


#include <QDate>
#include <QObject>
#include <QQmlEngine>



class CalenderClass : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString greeting READ greeting WRITE setGreeting NOTIFY greetingChanged)
    Q_ENUMS(DaysType)

public:
    CalenderClass(){};

    Q_INVOKABLE QString getClassName() {
        return "CalenderClass";
    }

    QString greeting() const {
        return m_greeting;
    }

    void setGreeting(const QString& txt) {
        m_greeting = txt;
    }


    enum DaysType {
        SUNDAY = 1,
        MONDAY = 2,
        TUESDAY = 3,
        WEDNESDAY = 4,
        THURSDAY = 5,
        FRIDAY = 6,
        SATURDAY = 7
    };

signals:
    void greetingChanged();

private:
    QString m_greeting;
};



#endif // CALENDERCLASS_H
