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
        frontDefault        <- map["front_default"]
        frontShiny          <- map["front_shiny"]
        frontFemale         <- map["front_female"]
        frontShinyFemale    <- map["front_shiny_female"]
        backDefault         <- map["back_default"]
        backFemale          <- map["back_female"]
        backFemale          <- map["back_female"]
        backShinyFemale     <- map["back_shiny_female"]
    }
    
}
