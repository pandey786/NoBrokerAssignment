//
//  PropertySearchRouter.swift
//  NoBrokerAssignement
//
//  Created by Durgesh Pandey on 19/02/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import Foundation
import UIKit

class PropertySearchRouter: PropertySearchWireframe {
    
    var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        
        let view: PropertySearchViewController = propertySearchStoryBoard.instantiateViewController(withIdentifier: "PropertySearchViewController") as! PropertySearchViewController
        
        let interactor = PropertySearchInteractor()
        let presenter = PropertySearchPresenter()
        let router = PropertySearchRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        router.viewController = view
        
        return UINavigationController.init(rootViewController: view)
    }
}
