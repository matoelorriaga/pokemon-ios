//
//  DetailsAPIStore.swift
//  pokemon-ios
//
//  Created by Matías Elorriaga on 10/4/17.
//  Copyright © 2017 melorriaga. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class DetailsAPIStore: DetailsStoreProtocol {
    
    func getPokemonDetails(id: Int, completionHandler: @escaping (Pokemon?) -> Void) {
        let url = "http://pokeapi.co/api/v2/pokemon/\(id)/"
        
        Alamofire.request(url).responseObject { (response: DataResponse<Pokemon>) in
            completionHandler(response.result.value)
        }
    }

}
