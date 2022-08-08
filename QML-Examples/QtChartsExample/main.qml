import QtQuick 2.12
import QtQuick.Window 2.12
import QtCharts 2.0
import QtQuick.Layouts 1.15
import QtQuick.VirtualKeyboard 2.4

Window {
    id: window
    visible: true
    width: 900
    height: 900
    title: qsTr("Hello World")

    GridLayout {
        id: mainGrid
        anchors.centerIn: parent
        anchors.fill: parent
        rows: 3
        columns: 3

        ChartView {
            id: chartComp

            width: 400
            height: 400
            theme: ChartView.ChartThemeBrownSand
            antialiasing: true

            PieSeries {
                id: pieSeries
                PieSlice { label: "A Property"; value: 94.9 }
                PieSlice { label: "B Property"; value: 5.1 }
                PieSlice { label: "C Property"; value: 50 }
            }
        }

        ChartView {
            title: "Line"
            width: 400
            height: 400
            antialiasing: true

            LineSeries {
                name: "LineSeries"
                XYPoint { x: 0; y: 0 }
                XYPoint { x: 1.1; y: 2.1 }
                XYPoint { x: 1.9; y: 3.3 }
                XYPoint { x: 2.1; y: 2.1 }
                XYPoint { x: 2.9; y: 4.9 }
                XYPoint { x: 3.4; y: 3.0 }
                XYPoint { x: 4.1; y: 3.3 }
            }
        }

        ChartView {
            title: "Spline"
            width: 400
            height: 400
            antialiasing: true

            SplineSeries {
                name: "SplineSeries"
                XYPoint { x: 0; y: 0.0 }
                XYPoint { x: 1.1; y: 3.2 }
                XYPoint { x: 1.9; y: 2.4 }
                XYPoint { x: 2.1; y: 2.1 }
                XYPoint { x: 2.9; y: 2.6 }
                XYPoint { x: 3.4; y: 2.3 }
                XYPoint { x: 4.1; y: 3.1 }
            }
        }
        ChartView {
            title: "Scatters"
            width: 400
            height: 400
            antialiasing: true

            ScatterSeries {
                id: scatter1
                name: "Scatter1"
                XYPoint { x: 1.5; y: 1.5 }
                XYPoint { x: 1.5; y: 1.6 }
                XYPoint { x: 1.57; y: 1.55 }
                XYPoint { x: 1.8; y: 1.8 }
                XYPoint { x: 1.9; y: 1.6 }
                XYPoint { x: 2.1; y: 1.3 }
                XYPoint { x: 2.5; y: 2.1 }
            }
        }

        ChartView {
            title: "Bar series"
            width: 400
            height: 400
            legend.alignment: Qt.AlignBottom
            antialiasing: true

            BarSeries {
                id: mySeries
                axisX: BarCategoryAxis { categories: ["2007", "2008", "2009", "2010", "2011", "2012" ] }
                BarSet { label: "Bob"; values: [2, 2, 3, 4, 5, 6] }
                BarSet { label: "Susan"; values: [5, 1, 2, 4, 1, 7] }
                BarSet { label: "James"; values: [3, 5, 8, 13, 5, 8] }
            }
        }

        PolarChartView {
            title: "Two Series, Common Axes"
            width: 400
            height: 400
            legend.visible: false
            antialiasing: true

            ValueAxis {
                id: axisAngular
                min: 0
                max: 20
                tickCount: 9
            }

            ValueAxis {
                id: axisRadial
                min: -0.5
                max: 1.5
            }

            SplineSeries {
                id: series1
                axisAngular: axisAngular
                axisRadial: axisRadial
                pointsVisible: true
            }

            ScatterSeries {
                id: series2
                axisAngular: axisAngular
                axisRadial: axisRadial
                markerSize: 10
            }
        }
        Component.onCompleted: {
            for (var i = 0; i <= 20; i++) {
                series1.append(i, Math.random());
                series2.append(i, Math.random());
            }
        }
    }
        InputPanel {
            id: inputPanel
            z: 99
            x: 0
            y: window.height
            width: window.width

            states: State {
                name: "visible"
                when: inputPanel.active
                PropertyChanges {
                    target: inputPanel
                    y: window.height - inputPanel.height
                }
            }
            transitions: Transition {
                from: ""
                to: "visible"
                reversible: true
                ParallelAnimation {
                    NumberAnimation {
                        properties: "y"
                        duration: 250
                        easing.type: Easing.InOutQuad
                    }
                }
            }
        }
    }
