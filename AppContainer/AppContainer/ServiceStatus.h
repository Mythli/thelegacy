#ifndef SERVICESTATUS_H
#define SERVICESTATUS_H

namespace ServiceStatus {
    enum ServiceStatus {
        Crashed,
        Frozen,
        Kill,
        NotRunning,
        Exit,
        Running,
        Starting,
        Stopped,
        Terminate
    };
}

#endif // CATSSERVICESTATUS_H
