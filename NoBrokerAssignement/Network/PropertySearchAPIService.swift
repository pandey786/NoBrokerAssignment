//
//  PropertySearchApiService.swift
//  NoBrokerAssignement
//
//  Created by Durgesh Pandey on 19/02/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class PropertySearchApiService {
    
    static func fetchPropertyList(pageCount: Int, completionHandler: @escaping (_ propertyList: PropertySearchResultModel?, _ isError: Bool, _ error: String?) -> ()) {
 
        let properyUrl = API.propertySearchUrl + String(pageCount)
        Alamofire.request(properyUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .validate()
            .responseString(completionHandler: { (responseString) in
                print(responseString.value ?? "Could not get proper response")
            })
            .responseObject { (response: DataResponse<PropertySearchResultModel>) in
                
                switch response.result {
                case .success(let propertyResultModel):
                    
                    //Response received successfully
                    completionHandler(propertyResultModel, false, nil)
                    break
                case .failure(let error):
                    
                    //There was an error
                    completionHandler(nil, true, error.localizedDescription)
                    break
                }
        }
    }
}
