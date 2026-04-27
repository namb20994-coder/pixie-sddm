/**
 * Pixie SDDM - Clock Component
 * Author: xCaptaiN09
 */
import QtQuick

Item {

    id: clock

    property string backgroundSource: ""

    property color defaultHoursColor: "#AED68A"

    property color defaultMinutesColor: "#D4E4BC"

    property string fontFamily: "Google Sans Flex Freeze"

    property color baseAccent: config.accentColor

    property color smartHoursColor: defaultHoursColor

    property color smartMinutesColor: defaultMinutesColor

    property string timeStr: Qt.formatTime(new Date(), "HHmm")

    function updateColors() {
        var base = clock.baseAccent;

        // "Better than Pixel" Smart Visibility Logic:
        // Since the clock sits directly on the wallpaper, we must guarantee contrast.
        if (base.hsvValue < 0.5) {
            // If the chosen/extracted accent is too dark, force the clock to be bright and vibrant
            clock.smartHoursColor = Qt.hsva(base.hsvHue, 0.7, 0.9, 1.0);
            clock.smartMinutesColor = Qt.hsva(base.hsvHue, 0.45, 0.85, 1.0);
        } else if (base.hsvValue > 0.8 && base.hsvSaturation < 0.2) {
            // Very bright/white-ish: Darken slightly to keep it readable on bright wallpapers
            clock.smartHoursColor = Qt.hsva(base.hsvHue, 0.8, 0.7, 1.0);
            clock.smartMinutesColor = Qt.hsva(base.hsvHue, 0.5, 0.75, 1.0);
        } else {
            // Standard Range: Bold & Vibrant
            clock.smartHoursColor = Qt.hsva(base.hsvHue, Math.min(1.0, base.hsvSaturation * 1.3), 0.95, 1.0);
            clock.smartMinutesColor = Qt.hsva(base.hsvHue, Math.min(1.0, base.hsvSaturation * 0.75), 0.92, 1.0);
        }
    }

    onBaseAccentChanged: updateColors()
    Component.onCompleted: updateColors()

    Row {
        anchors.centerIn: parent
        spacing: 0 

        Column {
            spacing: -130 
            Text {
                text: clock.timeStr.charAt(0)
                color: clock.smartHoursColor
                font.pixelSize: 200
                font.family: clock.fontFamily
                font.weight: Font.Medium
                width: 130 
                horizontalAlignment: Text.AlignHCenter
                antialiasing: true
                // Anti-blend safety: Soft halo guarantees clock is ALWAYS visible over any wallpaper
                style: Text.Outline
                styleColor: Qt.rgba(0, 0, 0, 0.25)
            }
            Text {
                text: clock.timeStr.charAt(2)
                color: clock.smartMinutesColor
                font.pixelSize: 200
                font.family: clock.fontFamily
                font.weight: Font.Medium
                width: 130
                horizontalAlignment: Text.AlignHCenter
                antialiasing: true
                style: Text.Outline
                styleColor: Qt.rgba(0, 0, 0, 0.25)
            }
        }

        Column {
            spacing: -130
            Text {
                text: clock.timeStr.charAt(1)
                color: clock.smartHoursColor
                font.pixelSize: 200
                font.family: clock.fontFamily
                font.weight: Font.Medium
                width: 130
                horizontalAlignment: Text.AlignHCenter
                antialiasing: true
                style: Text.Outline
                styleColor: Qt.rgba(0, 0, 0, 0.25)
            }
            Text {
                text: clock.timeStr.charAt(3)
                color: clock.smartMinutesColor
                font.pixelSize: 200
                font.family: clock.fontFamily
                font.weight: Font.Medium
                width: 130
                horizontalAlignment: Text.AlignHCenter
                antialiasing: true
                style: Text.Outline
                styleColor: Qt.rgba(0, 0, 0, 0.25)
            }
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            clock.timeStr = Qt.formatTime(new Date(), "HHmm")
        }
    }
}
