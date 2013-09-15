#ifndef SERVICE_H
#define SERVICE_H

#include <iostream>

#include <QCoreApplication>
#include <QtServiceBase>

#include "ServiceGroup.h"

class Service :
        public QtService<QCoreApplication>,
        public ServiceGroup
{
public:
    Service(int argc, char **argv)
        : QtService<QCoreApplication>(argc, argv, "CATS service")
    {
        this->setServiceDescription("CATS/service");
    }

protected:
    void start() {
        this->Start();
    }
    void stop() {
        this->Stop();
    }
    void pause() { }
    void resume() { }
    void processCommand(int code) { }
};

#endif // CATSSERVICE_H
