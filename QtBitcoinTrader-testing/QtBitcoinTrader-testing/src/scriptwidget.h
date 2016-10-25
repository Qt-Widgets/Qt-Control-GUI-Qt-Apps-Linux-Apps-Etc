//  This file is part of Qt Bitcion Trader
//      https://github.com/JulyIGHOR/QtBitcoinTrader
//  Copyright (C) 2013-2014 July IGHOR <julyighor@gmail.com>
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  In addition, as a special exception, the copyright holders give
//  permission to link the code of portions of this program with the
//  OpenSSL library under certain conditions as described in each
//  individual source file, and distribute linked combinations including
//  the two.
//
//  You must obey the GNU General Public License in all respects for all
//  of the code used other than OpenSSL. If you modify file(s) with this
//  exception, you may extend this exception to your version of the
//  file(s), but you are not obligated to do so. If you do not wish to do
//  so, delete this exception statement from your version. If you delete
//  this exception statement from all source files in the program, then
//  also delete it here.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.

#ifndef SCRIPTWIDGET_H
#define SCRIPTWIDGET_H

#include <QWidget>
#include <QScriptEngine>
#include <QMenu>

class QToolButton;
class ScriptObject;
namespace Ui {
class ScriptWidget;
}

class ScriptWidget : public QWidget
{
    Q_OBJECT

public:
	void replaceScript(QString);
    void setRunning(bool on);
    bool isRunning();
    explicit ScriptWidget(QString name, QString filePathSave="", QString fileCopyFrom="");
    ~ScriptWidget();
    bool executeScript(QString script, bool testMode);
    QString getFilePath();
    int getRuleGroupId();
    bool removeGroup();
    void languageChanged();
    void currencyChanged();
    bool saveScriptToFile(QString file="");

private slots:
    void on_ruleAddButton_clicked();
    void noteChanged();
    void errorHappend(int, QString);
    void addEventsClicked();
    void addFunctionClicked();
    void on_validateButton_clicked();
    void writeConsole(QString);
    void setRunningUi(bool);
    void clearLog();
    void on_buttonStartStop_clicked();
    void on_buttonClear_clicked();
    void on_limitRowsValue_valueChanged(int);
    void on_buttonSave_clicked();
    void on_scriptSave_clicked();
    void on_consoleOutput_textChanged();

protected:
    bool eventFilter(QObject *obj, QEvent *event);

private:
    void insertFilePath(QString description, QString mask);
    bool executeScript(bool testMode);

    QAction *NewEventsAction(QString name);
    QAction *NewFunctionsAction(QString name, QString params="");

    QList<QToolButton *> menuButtons;
    QMenu insertEventMenu;
    QMenu insertCommandMenu;
    QMenu insertFunctionMenu;

    ScriptObject *scriptObject;
    QString scriptName;
    QString fileName;
    Ui::ScriptWidget *ui;
signals:
    void setRuleTabRunning(QString,bool);
};

#endif // SCRIPTWIDGET_H
