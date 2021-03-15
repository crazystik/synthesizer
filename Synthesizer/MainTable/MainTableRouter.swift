//
//  MainTableRouter.swift
//  Synthesizer
//
//  Created by crazystik on 14.03.2021.
//

import UIKit

class MainTableRouter: MainTableRouterProtocol {
    weak var viewController: MainTableViewController?
    
    init(viewController: MainTableViewController) {
        self.viewController = viewController
    }
    
    func showOscilatorScene() {
        DispatchQueue.main.async {
            self.viewController?.navigationController?.pushViewController(
                OscilatorViewController(),
                animated: true
            )
        }
    }
}
