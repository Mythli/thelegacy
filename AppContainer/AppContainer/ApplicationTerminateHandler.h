#ifndef APPLICATIONCLOSEHANDLER_H
#define APPLICATIONCLOSEHANDLER_H

#include "ApplicationStatusHandler.h"
#include "ServiceStatus.h"
#include "ServiceApplicationData.h"
#include "ApplicationState.h"
#include "ServiceApplication.h"

class ApplicationTerminateHandler: public ApplicationStatusHandler {
public:
    void terminate() {
        this->State()->Process->terminate();
    }

    void update(IService *service) {
        switch(service->Status()->Code()) {
            case ServiceStatus::Terminate:
                this->terminate();
                break;
            case ServiceStatus::Stopped:
                this->terminate();
                break;
        }
    }
};

#endif // APPLICATIONCLOSEHANDLER_H
