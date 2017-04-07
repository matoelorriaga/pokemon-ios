//
//  Pokemon.swift
//  pokemon-ios
//
//  Created by Matías Elorriaga on 4/4/17.
//  Copyright © 2017 melorriaga. All rights reserved.
//

import Foundation
import ObjectMapper

class Pokemon: Mappable {
    
    var id: Int?
    var name: String?
    var height: Int?
    var weight: Int?
    var sprites: PokemonSprites?
    var baseExperience: Int?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id              <- map["id"]
        name            <- map["name"]
        height          <- map["height"]
        weight          <- map["weight"]
        sprites         <- map["sprites"]
        baseExperience  <- map["base_experience"]
    }
    
}
