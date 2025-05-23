#pragma once

#include "Models/ModelTypes.h"
#include <QAbstractListModel>
#include <QDebug>
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QStandardPaths>

struct Exercise {
     ExerciseTypeWrapper::ExerciseType type;
    int repetitions;
    float weight;
    int restTime;
    int sets;
};

class ExerciseModel : public QAbstractListModel {
    Q_OBJECT

public:
    enum ExerciseRoles {
        TypeRole = Qt::UserRole + 1,
        RepetitionsRole,
        WeightRole,
        RestTimeRole,
        SetsRole
    };



    ExerciseModel(QObject* parent = nullptr)
        : QAbstractListModel(parent) {
        loadFromFile();
    }

    int rowCount(const QModelIndex& parent = QModelIndex()) const override {
        Q_UNUSED(parent);
        return m_data.size();
    }

    QVariant data(const QModelIndex& index, int role) const override {
        if (!index.isValid() || index.row() >= m_data.size()) return QVariant();

        const Exercise& ex = m_data[index.row()];
        switch (role) {
        case TypeRole: return static_cast<int>(ex.type);
        case RepetitionsRole: return ex.repetitions;
        case WeightRole: return ex.weight;
        case RestTimeRole: return ex.restTime;
        case SetsRole: return ex.sets;
        default: return QVariant();
        }
    }

    QHash<int, QByteArray> roleNames() const override {
        return {
            { TypeRole, "type" },
            { RepetitionsRole, "repetitions" },
            { WeightRole, "weight" },
            { RestTimeRole, "restTime" },
            { SetsRole, "setsRole" }
        };
    }

    Q_INVOKABLE void addExercise(int type, int reps, float weight, int rest, int sets) {
        beginInsertRows(QModelIndex(), m_data.size(), m_data.size());
        m_data.append({ static_cast<ExerciseTypeWrapper::ExerciseType>(type), reps, weight, rest, sets });
        endInsertRows();

        qDebug() << "Added exercise:"
                 << "Type =" << type
                 << ", Reps =" << reps
                 << ", Weight =" << weight
                 << ", Rest time =" << rest
                 << ", Sets =" << sets;

    }

    Q_INVOKABLE void removeExercise(int index) {
        if (index < 0 || index >= m_data.size()) return;
        beginRemoveRows(QModelIndex(), index, index);
        m_data.removeAt(index);
        endRemoveRows();
    }


    Q_INVOKABLE void saveToFile() {
        QJsonArray exercisesArray;
        for (const Exercise& ex : m_data) {
            QJsonObject obj;
            obj["type"] = static_cast<int>(ex.type);
            obj["repetitions"] = ex.repetitions;
            obj["weight"] = ex.weight;
            obj["restTime"] = ex.restTime;
            obj["sets"] = ex.sets;
            exercisesArray.append(obj);
        }

        QJsonDocument doc(exercisesArray);
        const QString path = storageFilePath();
        QFile file(path);
        if (file.open(QIODevice::WriteOnly)) {
            file.write(doc.toJson());
            file.close();
            qDebug() << "Exercises saved to" << path;
        } else {
            qWarning() << "Failed to save exercises to" << path;
        }
    }

    Q_INVOKABLE void loadFromFile() {
        const QString path = storageFilePath();
        QFile file(path);
        if (!file.open(QIODevice::ReadOnly)) {
            qWarning() << "No existing file to load:" << path;
            return;
        }

        QByteArray data = file.readAll();
        file.close();

        QJsonDocument doc = QJsonDocument::fromJson(data);
        if (!doc.isArray()) return;
        for (const QJsonValue& val : doc.array()) {
            QJsonObject obj = val.toObject();
            Exercise ex;
            ex.type = static_cast<ExerciseTypeWrapper::ExerciseType>(obj["type"].toInt());
            ex.repetitions = obj["repetitions"].toInt();
            ex.weight = obj["weight"].toDouble();
            ex.restTime = obj["restTime"].toInt();
            ex.sets = obj["sets"].toInt();

            qDebug() << "Added exercise:"
                     << "Type =" <<  ex.type
                     << ", Reps =" <<  ex.repetitions
                     << ", Weight =" <<  ex.weight
                     << ", Rest time =" <<  ex.restTime
                     << ", Sets =" <<  ex.sets;
        }

        qDebug() << "Exercises loaded from" << path;
    }

    QString storageFilePath() const {
        return QStandardPaths::writableLocation(QStandardPaths::AppDataLocation) + "/exercises.json";
    }


private:
    QList<Exercise> m_data;
};
