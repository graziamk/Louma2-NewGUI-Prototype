#ifndef OSC_H
#define OSC_H

#include <QQuickItem>

class OSC : public QQuickItem
{
    Q_OBJECT
    Q_DISABLE_COPY(OSC)

public:
    explicit OSC(QQuickItem *parent = nullptr);
    ~OSC() override;
};

#endif // OSC_H
