#ifndef ISERVICEPROVIDER_H
#define ISERVICEPROVIDER_H

class Service;

class IServiceProvider {
public:
    virtual Service* GetService(int argc, char *argv[]) = 0;
};

#endif // ISERVICEPROVIDER_H
