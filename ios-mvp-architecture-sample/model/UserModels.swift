//
//  User.swift
//  ios-mvp-architecture-sample
//
//  Created by inofab-caner on 28.12.2018.
//  Copyright © 2018 inofab-caner. All rights reserved.
//

import Foundation
import ObjectMapper

struct UserList {
    
}

struct User:Mappable {
    
    var id: String?
    var name: String?
    var username: String?
    var email: String?
    var address: Address?
    var phone: String?
    var website: String?

    
    public init?(map: Map){}
    
    mutating public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        username <- map["username"]
        email <- map["email"]
        address <- map["address"]
        phone <- map["phone"]
        website <- map["website"]
    }
    
}

struct Address:Mappable {
    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?
    var geo: AdressCordinate?
    
    public init?(map: Map){}
    
    mutating public func mapping(map: Map) {
        street <- map["street"]
        suite <- map["suite"]
        city <- map["city"]
        zipcode <- map["zipcode"]
        geo <- map["geo"]
    }
}

struct AdressCordinate:Mappable{
    var lat: String?
    var lng: String?
    
    public init?(map: Map){}
    
    mutating public func mapping(map: Map) {
        lat <- map["lat"]
        lng <- map["lng"]
    }
}
