#ifndef SORTFILTERTODOS_H
#define SORTFILTERTODOS_H

#include <QSortFilterProxyModel>
#include <QObject>


class SortFilterTodos : public QSortFilterProxyModel
{
    Q_OBJECT
    Q_PROPERTY(bool doneFilterEnabled READ doneFilterEnabled WRITE setDoneFilterEnabled NOTIFY doneFilterEnabledChanged)
    Q_PROPERTY(bool unDoneFilterEnabled READ unDoneFilterEnabled WRITE setUnDoneFilterEnabled NOTIFY unDoneFilterEnabledChanged)
public:
    explicit SortFilterTodos(QObject* parent = nullptr);

    bool unDoneFilterEnabled() const;
    bool doneFilterEnabled() const;
public slots:
    void setDoneFilterEnabled(bool enabled);
    void setUnDoneFilterEnabled(bool enabled);
signals:
    void doneFilterEnabledChanged();
    void unDoneFilterEnabledChanged();

protected:
    bool filterAcceptsRow(int sourceRow, const QModelIndex& sourceParent) const override;
private:
    bool m_doneFilterEnabled;
    bool m_unDoneFilterEnabled;
};

#endif // SORTFILTERTODOS_H
