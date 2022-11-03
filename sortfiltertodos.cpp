#include "sortfiltertodos.h"
#include "todolistmodel.h"
#include <iostream>

SortFilterTodos::SortFilterTodos(QObject* parent)
    : QSortFilterProxyModel(parent), m_doneFilterEnabled(false)
{

}

bool SortFilterTodos::unDoneFilterEnabled() const
{
    return m_unDoneFilterEnabled;
}

bool SortFilterTodos::doneFilterEnabled() const
{
    return m_doneFilterEnabled;
}

void SortFilterTodos::setDoneFilterEnabled(bool enabled)
{
    if(m_doneFilterEnabled == enabled) {
        return;
    }

    m_doneFilterEnabled = enabled;
    emit doneFilterEnabledChanged();
    setFilterRole(TodoListModel::DoneRole);

    invalidateFilter();
}

void SortFilterTodos::setUnDoneFilterEnabled(bool enabled)
{
    if(m_unDoneFilterEnabled == enabled) {
        return;
    }

    m_unDoneFilterEnabled = enabled;
    emit unDoneFilterEnabledChanged();
    setFilterRole(TodoListModel::DoneRole);

    invalidateFilter();
}

bool SortFilterTodos::filterAcceptsRow(int sourceRow, const QModelIndex &sourceParent) const
{
    switch(filterRole()) {
        case TodoListModel::DoneRole:
            if(m_doneFilterEnabled) {
                const QModelIndex index = sourceModel()->index(sourceRow, 0, sourceParent);
                const bool doneType = index.data(filterRole()).toBool();
                return (doneType == true);
            }
            if(m_unDoneFilterEnabled) {
                const QModelIndex index = sourceModel()->index(sourceRow, 0, sourceParent);
                const bool doneType = index.data(filterRole()).toBool();
                return (doneType == false);
            }
        defaulf:
            return true;
    }


}
