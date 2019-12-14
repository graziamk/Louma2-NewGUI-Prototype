#include "osc_plugin.h"
#include "osc.h"

#include <qqml.h>

void OscPlugin::registerTypes(const char *uri)
{
    // @uri com.mycompany.qmlcomponents
    qmlRegisterType<OSC>(uri, 1, 0, "OSC");
}

