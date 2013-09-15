#ifndef TESTSERVICEPROVIDER_H
#define TESTSERVICEPROVIDER_H

#include "IServiceProvider.h"
#include "Service.h"
#include "ServiceGroup.h"
#include "ServiceApplication.h"
#include "ApplicationKeepAliveHandler.h"
#include "ApplicationTerminateHandler.h"
#include "ProcessStatusCollector.h"


class TestServiceProvider : public IServiceProvider {
public:
    Service* GetService(int argc, char *argv[]) {
        Service * service = new Service(argc, argv);

        ServiceGroup * cats = new ServiceGroup();
        service->AddCatsService(cats);

        ServiceApplication * application = new ServiceApplication();
        ServiceApplicationData * data = new ServiceApplicationData("CMD", "", "\"C:\\Windows\\System32\\xpsrchvw.exe\"", 10);
        application->Data(data);

        ProcessStatusCollector * processCollector = new ProcessStatusCollector();
        application->AttachStatusCollector(processCollector);

        ApplicationKeepAliveHandler * applicationKeepAlive = new ApplicationKeepAliveHandler();
        application->AttachStatusHandler(applicationKeepAlive);

        ApplicationTerminateHandler * applicationTerminate = new ApplicationTerminateHandler();
        application->AttachStatusHandler(applicationTerminate);

        cats->AddCatsService(application);
        return service;
    }
};

#endif // TESTSERVICEPROVIDER_H
