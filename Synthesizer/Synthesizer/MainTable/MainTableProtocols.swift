//
//  MainTableProtocols.swift
//  Synthesizer
//
//  Created by crazystik on 14.03.2021.
//

import Foundation

protocol MainTableViewProtocol: class {
    func style()
    func setSynthesizer(mods: [SynthesizerMod])
}

protocol MainTablePresenterProtocol: class {
    func configureView()
    func select(mod: SynthesizerMod)
}

protocol MainTableInteractorProtocol: class {
    
}

protocol MainTableRouterProtocol: class {
    func showOscilatorScene()
}

protocol MainTableConfiguratorProtocol: class {
    func configurator(viewController: MainTableViewController)
}
