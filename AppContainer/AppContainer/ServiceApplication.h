#ifndef SERVICEAPPLICATION_H
#define SERVICEAPPLICATION_H

#include <QProcess>

#include "ServiceBase.h"
#include "ServiceApplicationData.h"
#include "ApplicationState.h"
#include "ServiceStatus.h"
#include "ApplicationStateDependant.h"
#include "ApplicationStatusCollector.h"
#include "ApplicationStatusHandler.h"


class ServiceApplication : public ServiceBase
{
private:
    typedef std::vector<ApplicationStatusCollector*> tApplicationStatusCollectorVector;

    ApplicationState state;

    ServiceApplicationData * data() {
        return static_cast<ServiceApplicationData *>(this->Data());
    }

    tApplicationStatusCollectorVector statusCollectors;
public:
    static ServiceApplication* createServiceApplication() {

    }

    ServiceApplication() :
        ServiceBase()
    {
        this->state.Application = this;
    }

    virtual void AddCatsService(IService * service) { }

    virtual void RemoveCatsService(IService * service) { }

    virtual void Start() {
        this->Status(rCatsServiceStatusData(new ServiceStatusData(ServiceStatus::NotRunning, "", "Manueller Start", this)));
    }

    virtual void Stop() {
        this->Status(rCatsServiceStatusData(new ServiceStatusData(ServiceStatus::Stopped, "", "Manueller Stop", this)));
    }

    void InjectApplicationState(ApplicationStateDependant* dependant) {
        dependant->State(&this->state);
    }

    void AttachStatusHandler(StatusHandler *handler) {
        this->InjectApplicationState(static_cast<ApplicationStatusHandler*>(handler));
        ServiceBase::AttachStatusHandler(handler);
    }

    void AttachStatusCollector(ApplicationStatusCollector* StatusCollector) {
        this->InjectApplicationState(StatusCollector);
        this->statusCollectors.push_back(StatusCollector);
        StatusCollector->Start();
    }

    void DetachStatusCollector(ApplicationStatusCollector* StatusCollector) {
        // TODO: implement this
    }
};

#endif // CATSSERVICEAPPLICATION_H
