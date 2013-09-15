#ifndef STATUSHANDLER_H
#define STATUSHANDLER_H

class IService;

class StatusHandler {
public:
    virtual void update(IService* service) = 0;
};

#endif // STATUSHANDLER_H
