
#ifndef PLEXY_DESK_BACK_DROP_INTERFACE
#define PLEXY_DESK_BACK_DROP_INTERFACE

#include <QtCore>
#include <QtGui>

namespace PlexyDesk
{
    class BackdropInterface
    {
        public:
            BackdropInterface(){}
            ~BackdropInterface(){}
            QGraphicsItem * backdrop();
    };
} // namespace PlexyDesk

Q_DECLARE_INTERFACE(PlexyDesk::BackdropInterface, "org.plexydesk.BackdropInterface")
#endif
