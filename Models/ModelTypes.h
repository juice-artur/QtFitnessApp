#ifndef MODELTYPES_H
#define MODELTYPES_H

#include <qobject.h>
class ExerciseTypeWrapper : public QObject {
    Q_OBJECT
public:
    enum ExerciseType {
        PushUps,
        PullUps,
        BenchPress
    };
    Q_ENUM(ExerciseType)
};

#endif // MODELTYPES_H
