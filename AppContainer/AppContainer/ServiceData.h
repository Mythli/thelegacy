#ifndef SERVICEDATA_H
#define SERVICEDATA_H

#include <QString>

#include "ServiceStatus.h"

class ServiceData {
private:
    QString name;
    QString description;
    ServiceStatus::ServiceStatus status;
public:
    ServiceData() {

    }

    ServiceData(QString Name, QString Description) {
        this->Name(Name);
        this->Description(Description);
    }

    void Name(QString Name) {
        this->name = Name;
    }

    QString Name() {
        return this->name;
    }

    QString Description() {
        return this->description;
    }

    void Description(QString Description) {
        this->description = Description;
    }

    ServiceStatus::ServiceStatus Status() {
        return this->status;
    }

    void Status(ServiceStatus::ServiceStatus Status) {
        this->status = Status;
    }
};

#endif // SERVICEDATA_H
