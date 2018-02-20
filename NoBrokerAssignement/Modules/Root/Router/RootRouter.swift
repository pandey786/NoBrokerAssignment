//
//  RootRouter.swift
//  NoBrokerAssignement
//
//  Created by Durgesh Pandey on 19/02/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import UIKit

class RootRouter: RootWireframe {
    
    func presentHomeScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = PropertySearchRouter.assembleModule()
    }
}
