//
//  Oscillator.swift
//  Synthesizer
//
//  Created by crazystik on 14.03.2021.
//

import Foundation


enum Oscillator: Int {
    case sine
    case triangle
    case sawtooth
    case square
    case whiteNoise
    
    static var amplitude: Float = 1
    static var frequency: Float = 440
    static let maxFrequency: Float = 1024
    
    var signal: Signal {
        switch self {
        case .sine:
        return { (time: Float) -> Float in
               return Oscillator.amplitude * sin(2.0 * Float.pi * Oscillator.frequency * time)
           }
        case .triangle:
            return { (time: Float) -> Float in
                let period = 1.0 / Double(Oscillator.frequency)
                let currentTime = fmod(Double(time), period)
                let value = currentTime / period


                var result = 0.0
                if value < 0.25 {
                    result = value * 4
                } else if value < 0.75 {
                    result = 2.0 - (value * 4.0)
                } else {
                    result = value * 4 - 4.0
                }

                return Oscillator.amplitude * Float(result)
            }
        case .sawtooth:
            return { (time: Float) -> Float in
                let period = 1.0 / Oscillator.frequency
                let currentTime = fmod(Double(time), Double(period))
                return Oscillator.amplitude * ((Float(currentTime) / period) * 2 - 1.0)
            }
        case .square:
            return { (time: Float) -> Float in
                let period = 1.0 / Double(Oscillator.frequency)
                let currentTime = fmod(Double(time), period)
                return ((currentTime / period) < 0.5) ? Oscillator.amplitude : -1.0 * Oscillator.amplitude
            }
        case .whiteNoise:
            return { (time: Float) -> Float in
                return Oscillator.amplitude * Float.random(in: -1...1)
            }
        }
    }
}
