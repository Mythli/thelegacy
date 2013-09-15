#ifndef PROCESSSTATUSCOLLECTOR_H
#define PROCESSSTATUSCOLLECTOR_H

#include <iostream>

#include <QObject>
#include <QProcess>
#include <QDebug>

#include "ApplicationStatusCollector.h"
#include "ServiceApplication.h"

class ProcessStatusCollector : public QObject,
        public ApplicationStatusCollector

{
    Q_OBJECT
private:
    void registerSlots() {
        this->connect(State()->Process.data(), SIGNAL(stateChanged(QProcess::ProcessState)),
                this, SLOT(processStateChanged(QProcess::ProcessState)));

        this->connect(State()->Process.data(), SIGNAL(error(QProcess::ProcessError)),
                this, SLOT(processError(QProcess::ProcessError)));

        this->connect(State()->Process.data(), SIGNAL(finished(int,QProcess::ExitStatus)),
                this, SLOT(processFinished(int,QProcess::ExitStatus)));
    }

public:
    ProcessStatusCollector():
        QObject(0),
        ApplicationStatusCollector()
    {

    }

    void Start() {
        this->registerSlots();
    }

    void Stop() {
        // TODO: implement this
    }


private slots:
    void processFinished(int exitCode, QProcess::ExitStatus exitStatus) {
        switch(exitStatus) {
        case QProcess::NormalExit:
            this->State()->Application->Status(rCatsServiceStatusData(new ServiceStatusData(ServiceStatus::NotRunning, "", "Process closed normaly.", this->State()->Application)));
            break;
        case QProcess::CrashExit:
            this->State()->Application->Status(rCatsServiceStatusData(new ServiceStatusData(ServiceStatus::Crashed, "", "Process crashed.", this->State()->Application)));
            break;
        }
    }

    void processError(QProcess::ProcessError error) {
    }

    void processStateChanged(QProcess::ProcessState newState) {

        switch(newState) {
        case QProcess::Starting:
            qDebug() << Q_FUNC_INFO << QString::number((int)this->State()->Process->pid());
            this->State()->Application->Status(rCatsServiceStatusData(new ServiceStatusData(ServiceStatus::Starting, "", "Process is starting.", this->State()->Application)));
            break;
        case QProcess::Running:
            this->State()->Application->Status(rCatsServiceStatusData(new ServiceStatusData(ServiceStatus::Running, "", "Process is running.", this->State()->Application)));
            break;
        }
    }
};

#endif // PROCESSSTATUSCOLLECTOR_H
