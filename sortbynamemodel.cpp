#include "sortbynamemodel.h"

SortByNameModel::SortByNameModel(QObject *parent)
    : QSortFilterProxyModel{parent}
{

}

bool SortByNameModel::lessThan(const QModelIndex &sourceLeft, const QModelIndex &sourceRight) const
{
    const std::string leftData = sourceLeft.data(TodoListModel::NameRole).toString().toUtf8().constData();
    const std::string rightData = sourceRight.data(TodoListModel::NameRole).toString().toUtf8().constData();
    //std::transform(leftData.begin(), leftData.end(), leftData.begin(), std::tolower);

    return leftData.compare(rightData) < 0;
    //return leftData.size() < rightData.size();
}
