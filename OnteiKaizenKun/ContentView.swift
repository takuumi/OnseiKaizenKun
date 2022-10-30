//
//  ContentView.swift
//  OnteiKaizenKun
//
//  Created by Takumi Sakamoto on 2022/10/30.
//

import SwiftUI


struct ContentView: View {
    
    @State var msg = "ありがとう"

    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                VStack {
                    NavigationLink(destination: OnteiDisplay()){
                        Text("音程をみえるかしよう。")
                    }
                    Divider()
                }
                VStack {
                    NavigationLink(destination: Recorder()){
                        Text("自分の声を聞いてみよう。")
                    }
                    Divider()
                }
                VStack {
                    NavigationLink(destination: KeyBoardOntei()){
                        Text("キーボードを弾いてみよう。")
                    }
                    Divider()

                }.navigationTitle("お品書き")

             
                
                
            }
        }

        VStack {
            Button("Tap") {
                msg = "Thank you!"
            }
            .font(.headline)
            .foregroundColor(.white)
            .background(
                Capsule()
                    .foregroundColor(.green)
                    .frame(width:80, height: 30)
            )
            Text(msg).padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
