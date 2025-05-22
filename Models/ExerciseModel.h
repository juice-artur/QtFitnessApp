#pragma once

#include "Models/ModelTypes.h"
#include <QAbstractListModel>
#include <QDebug>

struct Exercise {
     ExerciseTypeWrapper::ExerciseType type;
    int repetitions;
    float weight;
    int restTime;
};

class ExerciseModel : public QAbstractListModel {
    Q_OBJECT

public:
    enum ExerciseRoles {
        TypeRole = Qt::UserRole + 1,
        RepetitionsRole,
        WeightRole,
        RestTimeRole
    };



    ExerciseModel(QObject* parent = nullptr)
        : QAbstractListModel(parent) {}

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
        default: return QVariant();
        }
    }

    QHash<int, QByteArray> roleNames() const override {
        return {
            { TypeRole, "type" },
            { RepetitionsRole, "repetitions" },
            { WeightRole, "weight" },
            { RestTimeRole, "restTime" }
        };
    }

    Q_INVOKABLE void addExercise(int type, int reps, float weight, int rest) {
        beginInsertRows(QModelIndex(), m_data.size(), m_data.size());
        m_data.append({ static_cast<ExerciseTypeWrapper::ExerciseType>(type), reps, weight, rest });
        endInsertRows();

        qDebug() << "Added exercise:"
                 << "Type =" << type
                 << ", Reps =" << reps
                 << ", Weight =" << weight
                 << ", Rest time =" << rest;

    }

    Q_INVOKABLE void removeExercise(int index) {
        if (index < 0 || index >= m_data.size()) return;
        beginRemoveRows(QModelIndex(), index, index);
        m_data.removeAt(index);
        endRemoveRows();
    }

private:
    QList<Exercise> m_data;
};
