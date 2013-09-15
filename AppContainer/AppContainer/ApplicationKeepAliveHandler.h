#ifndef APPLICATIONKEEPALIVEHANDLER_H
#define APPLICATIONKEEPALIVEHANDLER_H

#include <QProcess>
#include <QDebug>
#include <QThread>

#include "ApplicationStatusHandler.h"
#include "ServiceStatus.h"
#include "ServiceApplicationData.h"
#include "ApplicationState.h"
#include "ServiceApplication.h"


class ApplicationKeepAliveHandler : public ApplicationStatusHandler {
public:
    void start() {
        QThread::msleep(static_cast<ServiceApplicationData*>(this->State()->Application->Data())->StartDelay());
        this->State()->Process->setWorkingDirectory(static_cast<ServiceApplicationData*>(this->State()->Application->Data())->WorkingDirectory());
        this->State()->Process->start(static_cast<ServiceApplicationData*>(this->State()->Application->Data())->Command());
        this->State()->Process->waitForStarted();
    }

    void update(IService *service) {
        switch(service->Status()->Code()) {
        case ServiceStatus::NotRunning:
            this->start();
            break;
        case ServiceStatus::Exit:
            this->start();
            break;
        }
    }
};

#endif // APPLICATIONKEEPALIVEHANDLER_H
