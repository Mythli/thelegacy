#ifndef ISERVICE_H
#define ISERVICE_H

#include "StatusHandler.h"
#include "ServiceStatusData.h"

class ServiceData;

class IService {
public:
    IService() {
    }

    virtual void Data(ServiceData* data) = 0;
    virtual ServiceData* Data() = 0;

    virtual bool HasParent() = 0;
    virtual void Parent(IService* parent) = 0;
    virtual IService* Parent() = 0;

    virtual void Status(rCatsServiceStatusData statusData) = 0;
    virtual rCatsServiceStatusData Status() = 0;

    virtual void AddCatsService(IService* service) = 0;
    virtual void RemoveCatsService(IService* service) = 0;

    virtual void AttachStatusHandler(StatusHandler* handler) = 0;
    virtual void DetachStatusHandler(StatusHandler* handler) = 0;

    virtual void Restart() = 0;
    virtual void Start() = 0;
    virtual void Stop() = 0;
};

#endif // ICATSSERVICE_H
