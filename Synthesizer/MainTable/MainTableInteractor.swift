//
//  MainTableInteractor.swift
//  Synthesizer
//
//  Created by crazystik on 14.03.2021.
//

import Foundation

class MainTableInteractor: MainTableInteractorProtocol {
    weak var presenter: MainTablePresenterProtocol?
    
    required init(presenter: MainTablePresenterProtocol) {
        self.presenter = presenter
    }
}
