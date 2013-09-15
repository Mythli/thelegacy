#ifndef SERVICEBASE_H
#define SERVICEBASE_H

#include <vector>

#include <QThread>

#include "IService.h"

class ServiceBase : public IService {
private:
    typedef std::vector<StatusHandler*> tStatusHandlerVector;

    rCatsServiceStatusData statusData;
    ServiceData* serviceData;
    IService* parent;

    tStatusHandlerVector statusHandlers;
public:
    ServiceBase() :
        statusData(NULL),
        serviceData(NULL),
        parent(NULL)
    {

    }

    virtual void Data(ServiceData* data) {
        this->serviceData = data;
    }

    virtual ServiceData* Data() {
        return this->serviceData;
    }

    virtual bool HasParent() {
        return this->Parent() != NULL;
    }

    virtual void Parent(IService* parent) {
        this->parent = parent;
    }

    virtual void Status(rCatsServiceStatusData statusData) {
        this->statusData.swap(statusData);

        for (tStatusHandlerVector::iterator it = this->statusHandlers.begin(); it != this->statusHandlers.end(); ++it) {
            (*it)->update(this);
        }

        if(this->HasParent()) {
            this->Parent()->Status(statusData);
        }
    }

    virtual rCatsServiceStatusData Status() {
        return this->statusData;
    }

    virtual IService* Parent() {
        return this->parent;
    }

    virtual void AttachStatusHandler(StatusHandler* handler) {
        statusHandlers.push_back(handler);
    }

    virtual void DetachStatusHandler(StatusHandler* handler) {
        //TODO: implement this
    }

    virtual void Restart() {
        this->Stop();
        this->Start();
    }
};

#endif // CATSSERVICEBASE_H
