//
//  PokemonSprites.swift
//  pokemon-ios
//
//  Created by Matías Elorriaga on 5/4/17.
//  Copyright © 2017 melorriaga. All rights reserved.
//

import Foundation
import ObjectMapper

class PokemonSprites: Mappable {
    
    var frontDefault: String?
    var frontShiny: String?
    var frontFemale: String?
    var frontShinyFemale: String?
    var backDefault: String?
    var backShiny: String?
    var backFemale: String?
    var backShinyFemale: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        frontDefault        <- map["frontDefault"]
        frontShiny          <- map["frontShiny"]
        frontFemale         <- map["frontFemale"]
        frontShinyFemale    <- map["frontShinyFemale"]
        backDefault         <- map["backDefault"]
        backFemale          <- map["backFemale"]
        backFemale          <- map["backFemale"]
        backShinyFemale     <- map["backShinyFemale"]
    }
    
}
