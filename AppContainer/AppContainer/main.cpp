#include "ConfiguredServiceProvider.h"

int main(int argc, char *argv[])
{
    IServiceProvider* serviceProvider = new ConfiguredServiceProvider();
    Service* service = serviceProvider->GetService(argc, argv);

    QString aa = QDir::currentPath();

    //return service->exec();
}
