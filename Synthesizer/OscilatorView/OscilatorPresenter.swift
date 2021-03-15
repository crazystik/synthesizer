//
//  OscilatorPresenter.swift
//  Synthesizer
//
//  Created by crazystik on 14.03.2021.
//

import UIKit

class OscilatorPresenter: OscilatorPresenterProtocol {
    
    weak var view: OscilatorViewProtocol?
    var interactor: OscilatorInteractorProtocol!
    var router: OscilatorRouterProtocol!
    
    required init(view: OscilatorViewProtocol?) {
        self.view = view
    }
    
    func configureView() {
        view?.style()
    }
    
    func updateOscillatorWaveform(selected index: Int) {
        Synthesizer
            .shared
            .setWaveformTo(
                Oscillator(
                    rawValue: index
                )!.signal
            )
    }
    
    func setSynthesizerParametersFrom(touches: TouchesEvent) {
        switch touches {
        case .ended, .cancelled:
            Synthesizer.shared.volume = 0
            view?.setParameterLabel(text: "Frequency: 0 Hz  Amplitude: 0%")
        case .begin(coordinate: let coordinate, viewSize: let viewSize),
             .moved(coordinate: let coordinate, viewSize: let viewSize):
            Synthesizer.shared.volume = 0.5
            Oscillator.amplitude = (viewSize.height - coordinate.y) / viewSize.height
            Oscillator.frequency = (coordinate.x / viewSize.width) * Oscillator.maxFrequency + 32
            let amplitudePercent = Int(Oscillator.amplitude * 100)
            let frequencyHertz = Int(Oscillator.frequency)
            view?.setParameterLabel(text: "Frequency: \(frequencyHertz) Hz  Amplitude: \(amplitudePercent)%")
        }
    }
}
