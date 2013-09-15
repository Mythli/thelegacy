#ifndef APPLICATIONSTATE_H
#define APPLICATIONSTATE_H

#include <QProcess>
#include <QSharedPointer>

class ServiceApplication;

typedef QSharedPointer<QProcess> rQProcess;

class ApplicationState
{
public:
    ApplicationState() :
        Application(NULL),
        Process(new QProcess())
    {

    }

    rQProcess Process;
    ServiceApplication* Application;
};

#endif // APPLICATIONSTATE_H
