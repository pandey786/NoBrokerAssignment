//
//  PropertySearchResultModel.swift
//  NoBrokerAssignement
//
//  Created by Durgesh Pandey on 19/02/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import Foundation
import ObjectMapper

struct PropertySearchResultModel: Mappable {
    
    var status: Int?
    var statusCode: Int?
    var message: String?
    var results: [PropertySearchModel]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        status       <- map["status"]
        statusCode       <- map["statusCode"]
        message       <- map["message"]
        results       <- map["data"]
    }
}

struct PropertySearchModel: Mappable {

    var propertyAge: Int?
    var parking: String?
    var parkingDesc: String?
    var shortlistedByLoggedInUser: Bool?
    var lastUpdateDate: Double?
    var balconies: Int?
    var furnishingDesc: String?
    var cupBoard: Int?
    var negotiable: Bool?
    var type: String?
    var ownerId: String?
    var rent: Double?
    var availableFrom: Double?
    var photos: [PropertyImageModel]?
    var propertySize: Int?
    var loanAvailable: Bool?
    var accomodationTypeDesc: String?
    var propertyCode: String?
    var id: String?
    var localityId: String?
    var adminEvent: String?
    var bathroom: Int?
    var propertyTitle: String?
    var longitude: Double?
    var powerBackup: String?
    var dateOnly: Double?
    var inactiveReason: Int?
    var locality: String?
    var active: Bool?
    var weight: Double?
    var creationDate: Double?
    var swimmingPool: Bool?
    var accomodationType: String?
    var relevance: Double?
    var waterSupply: String?
    var accurateLocation: Bool?
    var pinCode: Double?
    var totalFloor: Int?
    var lift: Bool?
    var deposit: Double?
    var gym: Bool?
    var detailUrl: String?
    var activationDate: Double?
    var facingDesc: String?
    var furnishing: String?
    var amenities: String?
    var photoAvailable: Bool?
    var typeDesc: String?
    var city: String?
    var shortUrl: String?
    var latitude: Double?
    var description: String?
    var facing: String?
    var title: String?
    var nbLocality: String?
    var leaseType: String?
    var society: String?
    var ownerName: String?
    var street: String?
    var managed: Int?
    var propertyType: String?
    var secondaryTitle: String?
    var floor: Int?
    var lastActivationDate: Double?
    var forLease: Bool?
    var inactiveReasonDesc: String?
    var mass_value: Double?
    var sponsored: Bool?
    var buildingId: Int?
    var tenantTypeDesc: String?
    //var amenitiesMap: Int?
    var location: String?
    var sharedAccomodation: Bool?
    var buildingType: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        propertyAge      <- map["propertyAge"]
        parking      <- map["parking"]
        parkingDesc      <- map["parkingDesc"]
        shortlistedByLoggedInUser      <- map["shortlistedByLoggedInUser"]
        lastUpdateDate      <- map["lastUpdateDate"]
        balconies      <- map["balconies"]
        furnishingDesc      <- map["furnishingDesc"]
        cupBoard      <- map["cupBoard"]
        negotiable      <- map["negotiable"]
        type      <- map["type"]
        ownerId      <- map["ownerId"]
        rent      <- map["rent"]
        availableFrom      <- map["availableFrom"]
        propertySize      <- map["propertySize"]
        loanAvailable      <- map["loanAvailable"]
        accomodationTypeDesc      <- map["accomodationTypeDesc"]
        propertyCode      <- map["propertyCode"]
        id      <- map["id"]
        photos     <- map["photos"]
        localityId      <- map["localityId"]
        adminEvent      <- map["adminEvent"]
        bathroom      <- map["bathroom"]
        propertyTitle      <- map["propertyTitle"]
        longitude      <- map["longitude"]
        powerBackup      <- map["powerBackup"]
        dateOnly      <- map["dateOnly"]
        inactiveReason      <- map["inactiveReason"]
        locality      <- map["locality"]
        active      <- map["active"]
        weight      <- map["weight"]
        creationDate      <- map["creationDate"]
        swimmingPool      <- map["swimmingPool"]
        accomodationType      <- map["accomodationType"]
        relevance      <- map["relevance"]
        waterSupply      <- map["waterSupply"]
        accurateLocation      <- map["accurateLocation"]
        pinCode      <- map["pinCode"]
        totalFloor      <- map["totalFloor"]
        lift      <- map["lift"]
        deposit      <- map["deposit"]
        gym      <- map["gym"]
        detailUrl      <- map["detailUrl"]
        activationDate      <- map["activationDate"]
        facingDesc      <- map["facingDesc"]
        furnishing      <- map["furnishing"]
        amenities      <- map["amenities"]
        photoAvailable      <- map["photoAvailable"]
        typeDesc      <- map["typeDesc"]
        city      <- map["city"]
        shortUrl      <- map["shortUrl"]
        latitude      <- map["latitude"]
        description      <- map["description"]
        facing      <- map["facing"]
        title      <- map["title"]
        nbLocality      <- map["nbLocality"]
        leaseType      <- map["leaseType"]
        society      <- map["society"]
        ownerName      <- map["ownerName"]
        street      <- map["street"]
        managed      <- map["managed"]
        propertyType      <- map["propertyType"]
        secondaryTitle      <- map["secondaryTitle"]
        floor      <- map["floor"]
        lastActivationDate      <- map["lastActivationDate"]
        forLease      <- map["forLease"]
        inactiveReasonDesc      <- map["inactiveReasonDesc"]
        mass_value      <- map["mass_value"]
        sponsored      <- map["sponsored"]
        buildingId      <- map["buildingId"]
        tenantTypeDesc      <- map["tenantTypeDesc"]
        location      <- map["location"]
        sharedAccomodation      <- map["sharedAccomodation"]
        buildingType      <- map["buildingType"]
    }
}

struct PropertyImageModel: Mappable {
    
    var image_thumbnail: String?
    var image_original: String?
    var image_large: String?
    var image_medium: String?
    var displayPic: Bool?
    var name: Int?
    var title: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        image_thumbnail       <- map["imagesMap.thumbnail"]
        image_original       <- map["imagesMap.original"]
        image_large       <- map["imagesMap.large"]
        image_medium       <- map["imagesMap.medium"]
        displayPic       <- map["displayPic"]
        name       <- map["name"]
        title       <- map["title"]
    }
}
