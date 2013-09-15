#ifndef APPLICATIONSTATUSHANDLER_H
#define APPLICATIONSTATUSHANDLER_H

#include "StatusHandler.h"
#include "ApplicationStateDependant.h"

class ApplicationStatusHandler :
        public StatusHandler,
        public ApplicationStateDependant
{

};

#endif // APPLICATIONSTATUSHANDLER_H
