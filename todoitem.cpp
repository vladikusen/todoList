#include "todoitem.h"

TodoItem::TodoItem(QObject *parent, std::string name, std::string date, std::string description, bool done)
    : QObject{parent}, name(name), date(date), description(description), done(done)
{
}

TodoItem::TodoItem(const TodoItem &that)
{
    this->setParent(that.parent());
    name = that.name;
    date = that.date;
    done = that.done;
    description = that.description;
}

TodoItem::TodoItem(TodoItem &&that)
{
    this->setParent(std::move(that.parent()));
    name = std::move(that.name);
    date = std::move(that.date);
    done = std::move(that.done);
    description = std::move(that.description);
}

std::string TodoItem::getName() const
{
    return name;
}

std::string TodoItem::getDate() const
{
    return date;
}

std::string TodoItem::getDescription() const
{
    return description;
}

bool TodoItem::getDone() const
{
    return done;
}

void TodoItem::setName(std::string newName)
{
    if(newName != name) {
        name = newName;
    }
}

void TodoItem::setDate(std::string newDate)
{
    if(newDate != date) {
        date = newDate;
    }
}

void TodoItem::setDescription(std::string newDescription)
{
    if(newDescription != description) {
        description = newDescription;
    }
}

void TodoItem::setDone()
{
    done = !done;
}
