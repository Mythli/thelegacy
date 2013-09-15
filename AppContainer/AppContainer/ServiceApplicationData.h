#ifndef SERVICEAPPLICATIONDATA_H
#define SERVICEAPPLICATIONDATA_H

#include <QString>

#include "ServiceData.h"

class ServiceApplicationData : public ServiceData {
private:
    QString command;
    QString workingDirectory;
    int startDelay;
public:
    ServiceApplicationData() :
        ServiceData()
    {
        this->StartDelay(0);
    }

    ServiceApplicationData(QString Name, QString Description, QString Command, int StartDelay) :
        ServiceData(Name, Description)
    {
        this->Command(Command);
        this->StartDelay(StartDelay);
    }

    QString WorkingDirectory() {
        return this->workingDirectory;
    }

    void WorkingDirectory(QString WorkingDirectory) {
        this->workingDirectory = WorkingDirectory;
    }

    QString Command() {
        return this->command;
    }

    void Command(QString Command) {
        this->command = Command;
    }

    void StartDelay(int StartDelay) {
        this->startDelay = startDelay;
    }

    int StartDelay() {
        return this->startDelay;
    }
};

#endif // SERVICEAPPLICATIONDATA_H
