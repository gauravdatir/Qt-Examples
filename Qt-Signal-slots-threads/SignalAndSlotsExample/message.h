#ifndef MESSAGE_H
#define MESSAGE_H

#include <QDate>
#include <QTimer>
#include <QObject>
#include <QQmlEngine>



class Message : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString message READ message WRITE setMessage NOTIFY messageChanged)
    Q_PROPERTY(QString pColor READ pColor WRITE setPColor NOTIFY pColorChanged)
    Q_PROPERTY(int pFont READ pFont WRITE setPFont NOTIFY pFontChanged)
public:
    Message();
    void init();

    void setMessage(const QString &a);

    void setPFont(int temp);
    void setPColor(const QString &color);


    int pFont() const;
    QString pColor() const;
    QString message() const;


    Q_INVOKABLE QString postMessage(const QString &msg);

    Q_INVOKABLE void startThreadCall(const QString &req, int type);  // 0 worker thread inherited, 1 move to thread
signals:

    void messageChanged();

    void pFontChanged();
    void pColorChanged();
    void threadCompleted(const QString &msgUpdate);
    void startThread(const QString &req);   // 0
    void startInThread(const QString &req);   // 1

public slots:
    void refresh() {
        qDebug() << "Called the C++ slot from qml";
    }

    void updateMsg(const QString &msg){
        postMessage("Updated Msg from single slot" + msg);
        setMessage(msg);
    }
private:
    QString m_message;
    int m_pFont;
    QString m_pColor;
    int count;
};


#endif // MESSAGE_H

