#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "todolistmodel.h"
#include <QQmlContext>
#include <QQuickView>
#include "sortfiltertodos.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    TodoListModel model;

    SortFilterTodos filterProxyModel;
    filterProxyModel.setSourceModel(&model);

    QQuickView view;
    view.rootContext()->setContextProperty("ToDoListModel", &model);
    view.rootContext()->setContextProperty("FilteredTodosModel", &filterProxyModel);
    view.setSource(QUrl("qrc:/main.qml"));
    view.setMinimumHeight(670);
    view.setMinimumWidth(670);
    view.show();

    return app.exec();
}
