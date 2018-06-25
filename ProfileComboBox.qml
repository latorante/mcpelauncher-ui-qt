import QtQuick 2.0
import QtQuick.Controls 2.4
import "ThemedControls"

MComboBox {
    property int addProfileIndex: count - 1

    property var profiles: profileManager.profiles

    function getProfile() {
        return profiles[currentIndex]
    }

    id: control

    model: {
        var ret = []
        for (var i = 0; i < profiles.length; i++)
            ret.push(profiles[i].name)
        ret.push("Add new profile...")
        return ret
    }

    delegate: ItemDelegate {
        property bool hasSeparator: index == addProfileIndex

        width: parent.width
        height: 32 + (separator.visible ? separator.height : 0)
        text: modelData
        highlighted: control.highlightedIndex === index

        Rectangle {
            id: separator
            width: parent.width
            height: 1
            color: 'black'
            visible: hasSeparator
        }

        contentItem: Text {
            anchors.fill: parent
            anchors.leftMargin: parent.padding
            anchors.rightMargin: parent.padding
            anchors.topMargin: (separator.visible ? separator.height : 0)
            text: modelData
            font.pointSize: 11
            verticalAlignment: Text.AlignVCenter
        }
    }

    onActivated: function(index) {
        if (index === addProfileIndex) {
            console.log("Open add profile dialog " + currentIndex)
            currentIndex = 0
        }
    }
}