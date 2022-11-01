//
//  Recorder.swift
//  音程かいぜんくん
//
//  Created by Takumi Sakamoto on 2022/10/30.
//
import AudioKit
import AudioKitEX
import AudioKitUI
import AVFoundation
import SwiftUI

struct RecorderData {
    var isRecording = false
    var isPlaying = false
}

class RecorderConductor: ObservableObject, HasAudioEngine {
    let engine = AudioEngine()
    var recorder: NodeRecorder?
    let player = AudioPlayer()
    var silencer: Fader?
    let mixer = Mixer()

    @Published var data = RecorderData() {
        didSet {
            if data.isRecording {
                do {
                    try recorder?.record()
                } catch let err {
                    print(err)
                }
            } else {
                recorder?.stop()
            }

            if data.isPlaying {
                if let file = recorder?.audioFile {
                    player.file = file
                    player.play()
                }
            } else {
                player.stop()
            }
        }
    }

    init() {
        guard let input = engine.input else {
            fatalError()
        }

        do {
            recorder = try NodeRecorder(node: input)
        } catch let err {
            fatalError("\(err)")
        }
        let silencer = Fader(input, gain: 0)
        self.silencer = silencer
        mixer.addInput(silencer)
        mixer.addInput(player)
        engine.output = mixer
    }
}

struct Recorder: View {
    @StateObject var conductor = RecorderConductor()

    var body: some View {
        VStack {
            Spacer()
            Text(conductor.data.isRecording ? "録音終了" : "録音開始。")
                .foregroundColor(.blue)
                .onTapGesture {
                conductor.data.isRecording.toggle()
            }
            Spacer()
            if(conductor.data.isRecording) {
                Text("録音中")
                    .foregroundColor(.gray)
            } else {
                Text(conductor.data.isPlaying ? "□ STOP" : "▷ PLAY")
                    .foregroundColor(.blue)
                    .onTapGesture {
                    conductor.data.isPlaying.toggle()
                }

            }
            Spacer()
        }

        .padding()
        .navigationTitle("Recorder")
        .onAppear {
            conductor.start()
        }
        .onDisappear {
            conductor.stop()
        }
    }
}

struct Recorder_Previews: PreviewProvider {
    static var previews: some View {
        Recorder()
    }
}
