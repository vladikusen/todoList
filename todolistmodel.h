#ifndef TODOLISTMODEL_H
#define TODOLISTMODEL_H

#include <QAbstractListModel>
#include "todoitem.h"
#include <deque>

class TodoListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit TodoListModel(QObject* parent = nullptr);
    enum {
        NameRole = Qt::UserRole,
        DateRole,
        DescriptionRole,
        DoneRole
    };
    int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    bool setData(const QModelIndex& index, const QVariant& value, int role = Qt::EditRole) override;
    QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;;
    Q_INVOKABLE void addTodo(QString name, QString date, QString description);
    QHash<int, QByteArray> roleNames() const override;

private:
    std::deque<TodoItem> list;
};

#endif // TODOLISTMODEL_H
