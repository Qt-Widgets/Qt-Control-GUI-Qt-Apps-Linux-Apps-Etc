CONFIG += designer plugin debug_and_release
TARGET = $$qtLibraryTarget($$TARGET)
TEMPLATE = lib
QTDIR_build:DESTDIR = $$QT_BUILD_TREE/plugins/designer
HEADERS = qreflex.h qreflexplugin.h
SOURCES = qreflex.cpp qreflexplugin.cpp
target.path = $$[QT_INSTALL_PLUGINS]/designer
sources.files = $$SOURCES $$HEADERS *.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/designer/qreflexplugin
INSTALLS += target sources
RESOURCES += qreflex.qrc
