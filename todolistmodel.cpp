#include "todolistmodel.h"

TodoListModel::TodoListModel(QObject *parent)
    : QAbstractListModel(parent)
{
    std::string k = "kkk";
    for(auto i = 0; i < 3; i++) {
        k += "k";
        list.push_back(std::move(TodoItem(this, k)));
    }

    std::string c = "c";
    for(auto i = 0; i < 2; i++) {
        c += "c";
        list.push_front(std::move(TodoItem(this, "defaults" + c, "22.2020.20", "description", false)));
        emit rowsInserted(QModelIndex(), 0, 0, {});
    }

}

TodoListModel::TodoListModel(const TodoListModel &that)
{
    list = that.list;
}

int TodoListModel::rowCount(const QModelIndex &parent) const
{
    return list.size();
}

bool TodoListModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(!index.isValid()) {
        return false;
    }

    switch(role) {
    case DoneRole:
        list.at(index.row()).setDone();
        break;
    case NameRole:
        list.at(index.row()).setName(value.toString().toStdString());
        break;
    case DescriptionRole:
        list.at(index.row()).setDescription(value.toString().toStdString());
        break;
    case DateRole:
        list.at(index.row()).setDate(value.toString().toStdString());
        break;
    default:
        return false;
    }

    emit dataChanged(index, index, { role });
    return true;
}

QVariant TodoListModel::data(const QModelIndex &index, int role) const {
    if(!index.isValid()) {
        return QVariant{};
    }

    switch(role) {
    case NameRole:
        return QString::fromStdString(list.at(index.row()).getName());
    case DateRole:
        return QString::fromStdString(list.at(index.row()).getDate());
    case DescriptionRole:
        return QString::fromStdString(list.at(index.row()).getDescription());
    case DoneRole:
        return list.at(index.row()).getDone();
    default:
        return QVariant{};
    }
}

void TodoListModel::addTodo(QString name, QString date, QString description)
{
    list.push_front(TodoItem(this, name.toUtf8().constData(), date.toUtf8().constData(), description.toUtf8().constData(), false));
    emit rowsInserted(QModelIndex(), 0, 0, {});
}

QHash<int, QByteArray> TodoListModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[DateRole] = "date";
    roles[DescriptionRole] = "description";
    roles[DoneRole] = "done";

    return roles;
}
