#include "qmlconstantsloader.h"


void QmlConstantsLoader::loadConstants(QQmlApplicationEngine &engine) {
    loadPlatform(engine);

}

void QmlConstantsLoader::loadPlatform(QQmlApplicationEngine &engine)
{
#ifdef WINDOWS_PLATFORM
    engine.rootContext()->setContextProperty("WINDOWS_PLATFORM", true);
    engine.rootContext()->setContextProperty("ANDROID_PLATFORM", false);
#endif
#ifdef ANDROID_PLATFORM
    engine.rootContext()->setContextProperty("ANDROID_PLATFORM", true);
    engine.rootContext()->setContextProperty("WINDOWS_PLATFORM", false);
#endif
}
