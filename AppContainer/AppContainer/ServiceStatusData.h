#ifndef SERVICESTATUSDATA_H
#define SERVICESTATUSDATA_H

#include <QString>
#include <QSharedPointer>

class IService;

class ServiceStatusData {
private:
    int code;
    QString details;
    QString message;
    IService* source;
public:
    ServiceStatusData() :
        source(NULL)
    {

    }

    ServiceStatusData(int Code, QString Details, QString Message, IService * Source) {
        this->Code(Code);
        this->Details(Details);
        this->Message(Message);
        this->Source(Source);
    }

    int Code() {
        return this->code;
    }

    void Code(int Code) {
        this->code = Code;
    }

    QString Details() {
        return this->details;
    }

    void Details(QString Details) {
        this->details = Details;
    }

    QString Message() {
        return this->message;
    }

    void Message(QString Message) {
        this->message = Message;
    }

    IService* Source() {
        return this->source;
    }

    void Source(IService* Source) {
        this->source = Source;
    }
};

typedef QSharedPointer<ServiceStatusData> rCatsServiceStatusData;

#endif // CATSSERVICESTATUSDATA_H
