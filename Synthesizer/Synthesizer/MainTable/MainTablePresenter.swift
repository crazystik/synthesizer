//
//  MainTablePresenter.swift
//  Synthesizer
//
//  Created by crazystik on 14.03.2021.
//

import UIKit

class MainTablePresenter: MainTablePresenterProtocol {
    weak var view: MainTableViewProtocol?
    var interactor: MainTableInteractorProtocol!
    var router: MainTableRouterProtocol!
    
    required init(view: MainTableViewProtocol?) {
        self.view = view
    }
    
    func configureView() {
        view?.style()
        view?.setSynthesizer(mods: SynthesizerMod.allCases)
    }
    
    func select(mod: SynthesizerMod) {
        switch mod {
        case .oscilator:
            router.showOscilatorScene()
        }
    }
}
