#ifndef APPLICATIONSTATEDEPENDANT_H
#define APPLICATIONSTATEDEPENDANT_H

#include "ApplicationState.h"

class ApplicationStateDependant {
private:
    ApplicationState* state;
public:
    ApplicationState* State() {
        return this->state;
    }

    void State(ApplicationState* State) {
        this->state = State;
    }
};

#endif // APPLICATIONSTATEDEPENDANT_H
