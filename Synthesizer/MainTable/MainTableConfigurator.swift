//
//  MainTableConfigurator.swift
//  Synthesizer
//
//  Created by crazystik on 14.03.2021.
//

import Foundation

class MainTableConfigurator: MainTableConfiguratorProtocol {
    func configurator(viewController: MainTableViewController) {
        let presenter = MainTablePresenter(view: viewController)
        let interactor = MainTableInteractor(presenter: presenter)
        let router = MainTableRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
