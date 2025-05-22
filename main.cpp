#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QSurfaceFormat>
#include <QQmlContext>

#include <Models/ExerciseModel.h>

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));
    QGuiApplication app(argc, argv);

    QSurfaceFormat fmt;
    fmt.setRedBufferSize(8);
    fmt.setGreenBufferSize(8);
    fmt.setBlueBufferSize(8);
    fmt.setAlphaBufferSize(8);
    QSurfaceFormat::setDefaultFormat(fmt);

    qmlRegisterUncreatableType<ExerciseTypeWrapper>(
        "App.Models", 1, 0,
        "ExerciseTypeWrapper",
        "Cannot create ExerciseTypeWrapper in QML");


    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("GymHelper", "Main");

    ExerciseModel* exerciseModel = new ExerciseModel();
    engine.rootContext()->setContextProperty("exerciseModel", exerciseModel);

    return app.exec();
}
