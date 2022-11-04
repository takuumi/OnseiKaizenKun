//
//  PitchRollingView.swift
//  音程かいぜんくん
//
//  Created by Takumi Sakamoto on 2022/11/03.
//

import SwiftUI

//var history:[Float] = []

public class RollingViewData {
    let bufferSampleCount = 128
    var history = [Float](repeating: 0.0, count: 1024)
    
    func calculate(_ data: Float) -> [Float] {
        history.reverse()
        _ = history.popLast()
        history.reverse()
        history.append(data)
        
        return history
    }
}

struct PitchRollingView: View {

    var rollingData = RollingViewData()

    
    var value : Float
    
    var body: some View {
        Text("hoge")
        Text(String(value))
        //rollingData.calculate(value)
                
    }
}


struct PitchRollingView_Previews: PreviewProvider {
    static var previews: some View {
        PitchRollingView(value: 0.0)
    }
}


