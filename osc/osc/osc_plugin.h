#ifndef OSC_PLUGIN_H
#define OSC_PLUGIN_H

#include <QQmlExtensionPlugin>

class OscPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    void registerTypes(const char *uri) override;
};

#endif // OSC_PLUGIN_H
