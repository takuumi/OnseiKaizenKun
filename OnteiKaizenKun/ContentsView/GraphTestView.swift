//
//  GraphTestView.swift
//  音程かいぜんくん
//
//  Created by Takumi Sakamoto on 2022/11/05.
//

import SwiftUI
import Charts
import LineChartView

struct Record: Identifiable {
    var id: UUID = UUID()
    let dateString: String
    let reps: Int
    let weight: Int
}

var records: [Record] = [
    Record(dateString: "2022/10/01", reps: 10, weight: 60),
    Record(dateString: "2022/10/02", reps: 20, weight: 40),
    Record(dateString: "2022/10/03", reps: 5, weight: 100)
]



var chartParameters = LineChartParameters(
    data: [
        LineChartData(42),
        LineChartData(25.8),
        LineChartData(88.19),
        LineChartData(15.0),
    ]
)


struct GraphTestView: View {
    var body: some View {
        Chart(records) {
            PointMark(
                x: .value("Date", $0.dateString),
                y: .value("Reps", $0.reps)
            )
        }
        .frame(height: 200)
        .padding(.horizontal)
        
        LineChartView(lineChartParameters: chartParameters)
        
    }
}

struct GraphTestView_Previews: PreviewProvider {
    static var previews: some View {
        GraphTestView()
    }
}
