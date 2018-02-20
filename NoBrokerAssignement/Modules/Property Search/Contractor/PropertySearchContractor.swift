//
//  PropertySearchContractor.swift
//  NoBrokerAssignement
//
//  Created by Durgesh Pandey on 19/02/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import Foundation
import UIKit

protocol PropertySearchView: IndicatableView {
    
    var presenter: PropertySearchPresentation! { get set }
    
    func showPropertyList(_ propertySearchModel: [PropertySearchModel])
    func showNoContentScreen()
    func clearLastSearchedData()
}

protocol PropertySearchPresentation: class {
    
    weak var view: PropertySearchView? { get set }
    var interactor: PropertySearchUseCase! { get set }
    var router: PropertySearchWireframe! { get set }
    
    func viewDidLoad()
    func fetchPropertyList(for pageCount: Int)
}

protocol PropertySearchUseCase: class {
    
    var output: PropertySearchInteractorOutput! { get set }
    
    func fetchPropertyList(for pageCount: Int)
}

protocol PropertySearchInteractorOutput: class {
    
    func propertyListFetchedSuccessfully(_ propertySearchModel: [PropertySearchModel])
    func propertyListFetchFailed()
}

protocol PropertySearchWireframe: class {
    
    weak var viewController: UIViewController? { get set }
    
    static func assembleModule() -> UIViewController
}
