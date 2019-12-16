pragma Singleton
import QtQuick 2.14
import OSC 1.0

Item {
    OSCReceiver {
        port: 3333
        onMessage: {
            console.log("Received OSC Message" + address + ' : ' + msg);
        }
    }

    OSCSender {
        id: oscSender
        ip: '255.255.255.255'
        port: 3333
    }
}
