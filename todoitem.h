#ifndef TODOITEM_H
#define TODOITEM_H

#include <QObject>
#include <QDate>

class TodoItem : public QObject
{
    Q_OBJECT
public:
    explicit TodoItem(QObject *parent = nullptr, std::string name = "default", std::string date = "27.27.27", std::string description = "defaultD", bool done = true);
    explicit TodoItem(const TodoItem& that);
    explicit TodoItem(TodoItem&& that);
    std::string getName() const;
    std::string getDate() const;
    std::string getDescription() const;
    bool getDone() const;

    void setName(std::string newName);
    void setDate(std::string newDate);
    void setDescription(std::string newDescription);
    void setDone();
signals:

private:
    std::string name;
    std::string date;
    std::string description;
    bool done;

};

#endif // TODOITEM_H
