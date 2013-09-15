#ifndef CONFIGUREDSERVICEPROVIDER_H
#define CONFIGUREDSERVICEPROVIDER_H

#include <QDir>
#include <QFileInfo>
#include <QtXml/QXmlInputSource>
#include <QtXml/QDomDocument>
#include <QDebug>

#include "IServiceProvider.h"
#include "Service.h"
#include "ServiceGroup.h"
#include "ServiceApplication.h"
#include "ApplicationKeepAliveHandler.h"
#include "ApplicationTerminateHandler.h"
#include "ProcessStatusCollector.h"

class ConfiguredServiceProvider :
    public IServiceProvider
{
private:
    QString configFileName;
    Service* service;

    QString getApplicationWiseFileName(QString ConfigFileName) {
        if(QDir::isRelativePath(ConfigFileName)) {
            return QDir::currentPath()+"/"+ConfigFileName;
        } else {
            return ConfigFileName;
        }
    }

    bool buildServiceGroup(QDomElement* Element, ServiceGroup* Group) {
        ServiceData* data = new ServiceData();
        this->parseServiceData(Element, data);
        Group->Data(data);

        if(Element->elementsByTagName("Service").count() > 0) {
            QDomElement serviceListElement = Element->elementsByTagName("Service").at(0).firstChild().toElement();
            while(!serviceListElement.isNull()) {
                IService* serviceNode = NULL;
                if(serviceListElement.toElement().elementsByTagName("Type").at(0).toElement().tagName() == "ServiceGroup") {
                    serviceNode = new ServiceGroup();
                } else {
                    serviceNode = new ServiceApplication();
                }
                Group->AddCatsService(serviceNode);
                this->parseNode(&serviceListElement, serviceNode);
                serviceListElement.nextSibling();
            }
        }
    }

    bool buildServiceApplication(QDomElement* Element, ServiceApplication* Application) {

    }


    bool parseServiceData(QDomElement* Element, ServiceData* Data) {
        Data->Name(Element->elementsByTagName("Name").at(0).toElement().text());
        Data->Description(Element->elementsByTagName("Description").at(0).toElement().text());
    }

    bool parseApplicationData(QDomElement* Element, ServiceApplicationData* Data) {
    }

    bool parseNode(QDomElement* Element, IService* ServiceRef) {
        QString type = Element->elementsByTagName("Type").at(0).toElement().text();

        if(type == "ServiceGroup") {
            this->buildServiceGroup(Element, static_cast<ServiceGroup *>(ServiceRef));
        }

        if(type == "ServiceApplication") {
            this->buildServiceApplication(Element, static_cast<ServiceApplication *>(ServiceRef));
        }
    }

    bool parseConfig(QString ConfigFileName) {
        if(!QFile::exists(ConfigFileName)) {
            qWarning() << Q_FUNC_INFO << "Can't find config file!" << ConfigFileName;
            return false;
        }

        QFile configFile(ConfigFileName);
        if(!configFile.open(QIODevice::ReadOnly | QIODevice::Text)) {
            qWarning() << Q_FUNC_INFO << "Can't open config file!" << ConfigFileName;
            return false;
        }

        QDomDocument xmlDocument;
        xmlDocument.setContent(&configFile);

        QDomElement serviceElement = xmlDocument.firstChild().firstChild().toElement().elementsByTagName("Service").at(0).toElement();
        this->parseNode(&serviceElement, this->service);
    }

public:
    ConfiguredServiceProvider()
    {
        this->ConfigFileName("AppCatsService.xml");
    }

    ConfiguredServiceProvider(QString ConfigFileName) {
        this->ConfigFileName(ConfigFileName);
    }

    void ConfigFileName(QString ConfigFileName) {
        this->configFileName = this->getApplicationWiseFileName(ConfigFileName);
    }

    QString ConfigFileName() {
        return this->configFileName;
    }

    Service* GetService(int argc, char *argv[]) {
        this->service = new Service(argc, argv);
        this->parseConfig(this->ConfigFileName());
        return this->service;
    }
};

#endif // CONFIGUREDSERVICEPROVIDER_H
