#ifndef APPLICATIONKILLHANDLER_H
#define APPLICATIONKILLHANDLER_H

#include "ApplicationStatusHandler.h"
#include "ServiceStatus.h"
#include "ServiceApplicationData.h"
#include "ApplicationState.h"
#include "ServiceApplication.h"

class ApplicationKillHandler: public ApplicationStatusHandler {
public:
    void kill() {
        this->State()->Process.kill();
    }

    void update(IService *service) {
        switch(service->Status()->Code()) {
            case ServiceStatus::Kill:
                this->kill();
                break;
            case ServiceStatus::Frozen:
                this->kill();
                break;
        }
    }
};

#endif // APPLICATIONKILLHANDLER_H
