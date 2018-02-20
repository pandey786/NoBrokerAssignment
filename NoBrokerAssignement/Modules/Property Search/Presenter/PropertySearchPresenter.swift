//
//  PropertySearchPresenter.swift
//  NoBrokerAssignement
//
//  Created by Durgesh Pandey on 19/02/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import Foundation

class PropertySearchPresenter: PropertySearchPresentation {
    
    var view: PropertySearchView?
    var interactor: PropertySearchUseCase!
    var router: PropertySearchWireframe!
    
    var propertySearchResults = [PropertySearchModel]()
    
    func viewDidLoad() {
        
    }
    
    func fetchPropertyList(for pageCount: Int) {
        
        //Show Activity Indicator for first page
        if pageCount == 1 {
            view?.showActivityIndicator()
        }
        
        //fetch Property
        interactor.fetchPropertyList(for: pageCount)
    }

}

extension PropertySearchPresenter: PropertySearchInteractorOutput {
    
    func propertyListFetchedSuccessfully(_ propertySearchModel: [PropertySearchModel]) {
        self.propertySearchResults = propertySearchModel
        
        view?.hideActivityIndicator()
        view?.showPropertyList(self.propertySearchResults)
    }
    
    func propertyListFetchFailed() {
        view?.hideActivityIndicator()
        view?.showNoContentScreen()
    }
}

