#-------------------------------------------------
#
# Project created by QtCreator 2013-04-23T13:33:15
#
#-------------------------------------------------

QT       += core \
    xml

QT       -= gui

TARGET = AppContainer
CONFIG   += console
CONFIG   -= app_bundle

TEMPLATE = app


SOURCES += main.cpp \

include(./libraries/qtservice/src/qtservice.pri)

HEADERS += \
    StatusHandler.h \
    ServiceData.h \
    ServiceApplicationData.h \
    ApplicationState.h \
    ApplicationKeepAliveHandler.h \
    ApplicationStateDependant.h \
    ApplicationStatusHandler.h \
    ApplicationKillHandler.h \
    ApplicationTerminateHandler.h \
    ApplicationStatusCollector.h \
    ProcessStatusCollector.h \
    Service.h \
    IService.h \
    ServiceStatusData.h \
    ServiceStatus.h \
    ServiceBase.h \
    ServiceGroup.h \
    ServiceApplication.h \
    IServiceProvider.h \
    TestServiceProvider.h \
    ConfiguredServiceProvider.h
