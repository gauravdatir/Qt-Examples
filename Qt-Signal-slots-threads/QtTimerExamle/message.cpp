#include "message.h"


Message::Message() {
    m_creationDate = QDateTime();
    m_currentDate = QDateTime();
    count =0;
    m_pFont =30;
    m_pColor = "red";
}


void Message::init(){
    timer = new QTimer(this);
    timer->setTimerType(Qt::TimerType::PreciseTimer);
    connect(timer, &QTimer::timeout, this, &Message::refresh);
    timer->start(10000);

    QTimer *secTimer = new QTimer(this);
    secTimer->setTimerType(Qt::TimerType::PreciseTimer);
    connect(secTimer, &QTimer::timeout, this, &Message::interUpdate);
    secTimer->start(100);

    QTimer::singleShot(10000, this, &Message::updateMsg);
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

void Message::setCurrentDate(const QDateTime &date) {
    if (date.isValid()) {
        m_currentDate = date;
        emit currentDateChanged();
    }
}

QDateTime Message::currentDate() const {
    return m_currentDate;
}

void Message::setPFont(int temp) {
    m_pFont = temp;
    emit pFontChanged();
}
void Message::setPColor(const QString &color) {
    if (color != m_pColor) {
        m_pColor = color;
        emit pColorChanged();
    }
}

int Message::pFont() const {
    return m_pFont;
}
QString Message::pColor() const {
    return  m_pColor;
}

QString Message::postMessage(const QString &msg) {
    qDebug() << "Called the C++ method with" << msg;
    count++;
    QString reply = "reply from c++ " + QString::number(count) ;
    return reply;
}



