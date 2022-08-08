#ifndef MESSAGE_H
#define MESSAGE_H

#include <QDate>
#include <QTimer>
#include <QObject>
#include <QQmlEngine>



class Message : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString author READ author WRITE setAuthor NOTIFY authorChanged)
    Q_PROPERTY(QDateTime creationDate READ creationDate WRITE setCreationDate NOTIFY creationDateChanged)
    Q_PROPERTY(QDateTime currentDate READ currentDate WRITE setCurrentDate NOTIFY currentDateChanged)
    Q_PROPERTY(QString pColor READ pColor WRITE setPColor NOTIFY pColorChanged)
    Q_PROPERTY(int pFont READ pFont WRITE setPFont NOTIFY pFontChanged)
public:
    Message();
    void init();
    void setAuthor(const QString &a);
    void setCreationDate(const QDateTime &date);
    void setCurrentDate(const QDateTime &date);
    void setPFont(int temp);
    void setPColor(const QString &color);

    int pFont() const;
    QString pColor() const;
    QString author() const;
    QDateTime creationDate() const;
    QDateTime currentDate() const;


    Q_INVOKABLE QString postMessage(const QString &msg);
signals:
    void authorChanged();
    void creationDateChanged();
    void currentDateChanged();
    void pFontChanged();
    void pColorChanged();
    void newMessagePosted(const QString &subject);
    void interUpdated(int interVal);

public slots:
    void refresh() {
        qDebug() << "Called the C++ slot from qml";
        QDateTime now = QDateTime::currentDateTime();
        setCurrentDate(now);
    }

    void updateMsg(){
        postMessage("Updated Msg from single slot");
        setAuthor("New Auther");
    }
    void  interUpdate()
    {
        int remainingTime = timer->remainingTime() / 1000;
        emit  interUpdated(remainingTime);
    }





private:
    QString m_author;
    QDateTime m_currentDate;
    QDateTime m_creationDate;
    int m_pFont;
    QString m_pColor;
    int count;
    QTimer *timer;
};


#endif // MESSAGE_H
