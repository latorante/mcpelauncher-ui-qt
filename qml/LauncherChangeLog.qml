import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.2
import "ThemedControls"
import io.mrarm.mcpelauncher 1.0

LauncherBase {

    signal finished()
    id: rowLayout
    spacing: 0

    ScrollView {
        Layout.fillHeight: true
        Layout.fillWidth: true
        clip: true
        TextEdit {
            textFormat: TextEdit.RichText
            text: "Welcome to the new Minecraft Linux Launcher Update<br/>" + LAUNCHER_CHANGE_LOG
            readOnly: true
            anchors.fill: parent
            wrapMode: Text.WordWrap
            selectByMouse: true
        }
    }

    bottomPanelContent: RowLayout {
        anchors.fill: parent

        Layout.minimumWidth: pbutton.implicitWidth

        PlayButton {
            id: pbutton
            Layout.alignment: Qt.AlignHCenter
            text: "Continue"
            Layout.preferredHeight: 70
            Layout.minimumWidth: implicitWidth
            Layout.minimumHeight: implicitHeight
            onClicked: {
                rowLayout.finished()
            }
        }

    }
}
