//
//  TouchesEvent.swift
//  Synthesizer
//
//  Created by Garage on 14.03.2021.
//

import Foundation

enum TouchesEvent {
    case begin(
            coordinate: (x: Float, y: Float),
            viewSize: (width: Float, height: Float)
        )
    case moved(
            coordinate: (x: Float, y: Float),
            viewSize: (width: Float, height: Float)
         )
    case ended
    case cancelled
}
