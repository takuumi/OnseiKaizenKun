//
//  ContentView.swift
//  OnteiKaizenKun
//
//  Created by Takumi Sakamoto on 2022/10/30.
//

import SwiftUI


struct ContentView: View {
    
    @State var msg = "押してみて！！"

    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                Divider()
                VStack {
                    NavigationLink(destination: OnteiDisplay()){
                        Image("image2")
                            .resizable()
                            .frame(width:60, height:60)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray))
                        Text("音程をみえるかしよう。")
                        Spacer()
                    }
                    Divider()
                }
                VStack {
                    NavigationLink(destination: Recorder()){
                        Image("image1")
                            .resizable()
                            .frame(width:60, height:60)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray))
                        Text("自分の声を聞いてみよう。")
                        Spacer()
                    }
                    Divider()
                }
                VStack {
                    NavigationLink(destination: KeyBoardOntei()){
                        Image("image2")
                            .resizable()
                            .frame(width:60, height:60)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray))
                        Text("キーボードを弾いてみよう。")
                        Spacer()
                    }
                    Divider()
                }
                VStack {
                    NavigationLink(destination: GraphTestView()){
                        Image("image1")
                            .resizable()
                            .frame(width:60, height:60)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray))
                        Text("グラフの練習をしよう")
                        Spacer()
                    }
                    Divider()
                }
                
            }
        }.navigationTitle(Text("お品書き"))


        VStack {
            
            Button("Tap") {
                msg = "ドドドヤァ！"
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
