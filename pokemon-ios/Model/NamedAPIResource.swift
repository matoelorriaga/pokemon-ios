//
//  NamedAPIResource.swift
//  pokemon-ios
//
//  Created by Matías Elorriaga on 5/4/17.
//  Copyright © 2017 melorriaga. All rights reserved.
//

import Foundation
import ObjectMapper

class NamedAPIResource: Mappable {
    
    var name: String?
    var url: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        name    <- map["name"]
        url     <- map["url"]
    }
    
}
