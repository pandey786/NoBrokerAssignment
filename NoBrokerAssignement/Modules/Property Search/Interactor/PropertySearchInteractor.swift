//
//  PropertySearchInteractor.swift
//  NoBrokerAssignement
//
//  Created by Durgesh Pandey on 19/02/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//
import Foundation

class PropertySearchInteractor: PropertySearchUseCase {
    
    var output: PropertySearchInteractorOutput!
    
    func fetchPropertyList(for pageCount: Int) {
        
        //Fetch Propertys List
        PropertySearchApiService.fetchPropertyList(pageCount: pageCount) { (propertyResultModel, isError, errorString) in
            
            //Check for Error
            if !isError {
                
                //No Error
                if let propertyListArr = propertyResultModel?.results {
                    
                    //List fetched successfully
                   self.output.propertyListFetchedSuccessfully(propertyListArr)
                } else {
                    
                    //No data Received or data could not be parsed
                    self.output.propertyListFetchFailed()
                }
            } else {
                
                //Error
                self.output.propertyListFetchFailed()
            }
        }
    }
}
