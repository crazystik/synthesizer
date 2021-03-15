//
//  OscilatorConfigurator.swift
//  Synthesizer
//
//  Created by crazystik on 14.03.2021.
//

import Foundation

class OscilatorConfigurator: OscilatorConfiguratorProtocol {
    func configurator(viewController: OscilatorViewController) {
        let presenter = OscilatorPresenter(view: viewController)
        let interactor = OscilatorInteractor(presenter: presenter)
        let router = OscilatorRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
