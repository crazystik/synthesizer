//
//  OscilatorInteractor.swift
//  Synthesizer
//
//  Created by crazystik on 14.03.2021.
//

import Foundation

class OscilatorInteractor: OscilatorInteractorProtocol {
    weak var presenter: OscilatorPresenterProtocol?
    
    required init(presenter: OscilatorPresenterProtocol) {
        self.presenter = presenter
    }
}
