//
//  OscilatorRouter.swift
//  Synthesizer
//
//  Created by crazystik on 14.03.2021.
//

import UIKit

class OscilatorRouter: OscilatorRouterProtocol {
    weak var viewController: OscilatorViewController?
    
    init(viewController: OscilatorViewController) {
        self.viewController = viewController
    }
}
