#ifndef APPLICATIONSTATUSCOLLECTOR_H
#define APPLICATIONSTATUSCOLLECTOR_H

#include "ApplicationStateDependant.h"

class ApplicationStatusCollector :
        public ApplicationStateDependant
{
public:
    virtual void Start() = 0;
    virtual void Stop() = 0;
};

#endif // APPLICATIONSTATUSCOLLECTOR_H
