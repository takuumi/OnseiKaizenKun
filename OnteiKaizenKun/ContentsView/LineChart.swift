//
//  LineChart.swift
//  音程かいぜんくん
//
//  Created by Takumi Sakamoto on 2022/11/05.
//

import Foundation

struct LineChart : UIViewRepresentable {
    
    typealias UIViewType = LineChartView
 
    func makeUIView(context: Context) -> LineChartView {
        let lineChartView = LineChartView()
 
        lineChartView.data = setData()
        
        return lineChartView
    }
    
    func updateUIView(_ uiView: LineChartView, context: Context) {
 
    }
    
    let yValue:[ChartDataEntry] = [
        ChartDataEntry(x: 1, y: 10.0),
        ChartDataEntry(x: 2, y: 20.0),
        ChartDataEntry(x: 3, y: 30.0),
        ChartDataEntry(x: 4, y: 40.0),
        ChartDataEntry(x: 5, y: 20.0)
    ]
    
    func setData() -> LineChartData{
        let set = LineChartDataSet(entries: yValue, label: "My data")
        let data = LineChartData(dataSet: set)
        
        return data
    }
}
