#ifndef SERVICEGROUP_H
#define SERVICEGROUP_H

#include <vector>

#include <QCoreApplication>

#include "ServiceBase.h"

class ServiceGroup : public ServiceBase {
private:
    typedef std::vector<IService*> tCatsServiceVector;

    tCatsServiceVector services;
public:
    ServiceGroup() :
        ServiceBase() {
    }

    virtual void AddCatsService(IService* service) {
        this->services.push_back(service);
        service->Parent(this);
    }

    virtual void RemoveCatsService(IService* service) {
        // TODO: implement this
    }

    virtual void Start() {
        for(tCatsServiceVector::iterator it = this->services.begin(); it != this->services.end(); ++it) {
            (*it)->Start();
        }
    }

    virtual void Stop() {
        for(tCatsServiceVector::iterator it = this->services.begin(); it != this->services.end(); ++it) {
            (*it)->Stop();
        }
    }
};

#endif // CATSSERVICEGROUP_H
