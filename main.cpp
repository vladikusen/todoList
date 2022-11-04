#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "todolistmodel.h"
#include <QQmlContext>
#include <QQuickView>
#include "sortfiltertodos.h"
#include "sortbynamemodel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    TodoListModel model;

    SortFilterTodos filterProxyModel;
    SortByNameModel sortProxyModel;
    sortProxyModel.setSourceModel(&model);
    filterProxyModel.setSourceModel(&model);

    QQuickView view;
    view.rootContext()->setContextProperty("ToDoListModel", &model);
    view.rootContext()->setContextProperty("FilteredTodosModel", &filterProxyModel);
    view.rootContext()->setContextProperty("SortNameTodosModel", &sortProxyModel);
    view.setSource(QUrl("qrc:/main.qml"));
    view.setMinimumHeight(670);
    view.setMinimumWidth(670);
    view.show();

    return app.exec();
}
