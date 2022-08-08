#include "message.h"


Message::Message() {
    m_creationDate = QDateTime();
    count =0;
    connect(this, &Message::newMessagePosted, this, &Message::onNewMessage);
}

void Message::setAuthor(const QString &a) {
    if (a != m_author) {
        m_author = a;
        emit authorChanged();
    }
}

QString Message::author() const {
    return m_author;
}

void Message::setCreationDate(const QDateTime &date) {
    if (date.isValid()) {
        m_creationDate = date;
        emit creationDateChanged();
    }
}

QDateTime Message::creationDate() const {
    return m_creationDate;
}

QString Message::postMessage(const QString &msg) {
       qDebug() << "Called the C++ method with" << msg;
       count++;
       QString reply = "reply from c++ " + QString::number(count) ;
       return reply;
   }

void Message::onNewMessage(const QString &subject){
     qDebug() << "slot for new msg";
      qDebug() << subject;
}
