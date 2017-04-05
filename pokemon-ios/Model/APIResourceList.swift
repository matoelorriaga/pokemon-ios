//
//  APIResourceList.swift
//  pokemon-ios
//
//  Created by Matías Elorriaga on 5/4/17.
//  Copyright © 2017 melorriaga. All rights reserved.
//

import Foundation
import ObjectMapper

class APIResourceList: Mappable {
    
    var count: Int?
    var next: String?
    var previous: Bool?
    var results: [NamedAPIResource]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        count <- map["count"]
        next <- map["next"]
        previous <- map["previous"]
        results <- map["results"]
    }
    
}
