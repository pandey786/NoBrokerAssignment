//
//  PropertyFilterRouter.swift
//  NoBrokerAssignement
//
//  Created by Durgesh Pandey on 19/02/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import Foundation
import UIKit

class PropertyFilterRouter: PropertySearchWireframe {
    
    var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        
        let view: PropertyFilterViewController = propertyFilterStoryBoard.instantiateViewController(withIdentifier: "PropertyFilterViewController") as! PropertyFilterViewController
        
        return UINavigationController.init(rootViewController: view)
    }
}
