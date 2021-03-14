//
//  SynthesizerMod.swift
//  Synthesizer
//
//  Created by Garage on 14.03.2021.
//

import Foundation

enum SynthesizerMod: CaseIterable {
    case oscilator
    
    var name: String {
        switch self {
        case .oscilator:
            return "Oscilator"
        }
    }
}
