//
//  CommonSynthesizerProtocols.swift
//  Synthesizer
//
//  Created by crazystik on 14.03.2021.
//

import Foundation

protocol OscilatorViewProtocol: class {
    func style()
    func setParameterLabel(text: String)
}

protocol OscilatorPresenterProtocol: class {
    func configureView()
    func updateOscillatorWaveform(selected index: Int)
    func setSynthesizerParametersFrom(touches: TouchesEvent)
}

protocol OscilatorInteractorProtocol: class {
    
}

protocol OscilatorRouterProtocol: class {
    
}

protocol OscilatorConfiguratorProtocol: class {
    func configurator(viewController: OscilatorViewController)
}
