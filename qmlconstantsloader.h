#ifndef QMLCONSTANTSLOADER_H
#define QMLCONSTANTSLOADER_H
#include <QQmlApplicationEngine>
#include <QQmlContext>


namespace QmlConstantsLoader {
    void loadConstants(QQmlApplicationEngine & engine);
    void loadPlatform(QQmlApplicationEngine & engine);
}
#endif // QMLCONSTANTSLOADER_H
