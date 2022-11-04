#ifndef SORTBYNAMEMODEL_H
#define SORTBYNAMEMODEL_H

#include <QObject>
#include <QSortFilterProxyModel>
#include "todolistmodel.h"

class SortByNameModel : public QSortFilterProxyModel
{
    Q_OBJECT
public:
    explicit SortByNameModel(QObject *parent = nullptr);
protected:
    bool lessThan(const QModelIndex& sourceLeft, const QModelIndex& sourceRight) const override;
signals:

};

#endif // SORTBYNAMEMODEL_H
