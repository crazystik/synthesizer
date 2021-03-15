//
//  Synthesizer.swift
//  Synthesizer
//
//  Created by crazystik on 14.03.2021.
//

import Foundation
import AVFoundation

typealias Signal = (Float) -> (Float)

class Synthesizer {
    
    // MARK: - Properties
    
    // MARK: Public Properties
    public static let shared = Synthesizer()
    public var volume: Float {
        set {
            audioEngine.mainMixerNode.outputVolume = newValue
        }
        get {
            return audioEngine.mainMixerNode.outputVolume
        }
    }
    
    // MARK: Private Properties
    private var audioEngine: AVAudioEngine
    private var time: Float = 0
    private let sampleRate: Double
    private let deltaTime: Float
    private var signal: Signal
    
    private lazy var sourceNode: AVAudioSourceNode = AVAudioSourceNode { (one,two, frameCount, audioBufferList) -> OSStatus in
        let ablPointer = UnsafeMutableAudioBufferListPointer(audioBufferList)
        for frame in 0..<Int(frameCount) {
            let sampleValue = self.signal(self.time)
            self.time += self.deltaTime
            for buffer in ablPointer {
                let buf: UnsafeMutableBufferPointer<Float> = UnsafeMutableBufferPointer(buffer)
                buf[frame] = sampleValue
            }
        }
        return noErr
    }
    
    
    // MARK: Init
    init(signal: @escaping Signal = Oscillator.sine.signal) {
        audioEngine = AVAudioEngine()
        
        let mainMixer = audioEngine.mainMixerNode
        let outputNode = audioEngine.outputNode
        let format = outputNode.inputFormat(forBus: 0)
        
        sampleRate = format.sampleRate
        deltaTime = 1 / Float(sampleRate)
        
        self.signal = signal
        
        let inputFormat = AVAudioFormat(
            commonFormat: format.commonFormat,
            sampleRate: sampleRate,
            channels: 1, interleaved: format.isInterleaved
        )
        audioEngine.attach(sourceNode)
        audioEngine.connect(
            sourceNode,
            to: mainMixer,
            format: inputFormat
        )
        audioEngine.connect(mainMixer, to: outputNode, format: nil)
        mainMixer.outputVolume = 0
        do {
            try audioEngine.start()
        } catch {
            print("Could not start engine: \(error.localizedDescription)")
        }
    }
     
    // MARK: Public Functions
    public func setWaveformTo(_ signal: @escaping Signal) {
        self.signal = signal
    }
}
