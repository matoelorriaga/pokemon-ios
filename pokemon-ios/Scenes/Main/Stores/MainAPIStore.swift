//
//  MainAPIStore.swift
//  pokemon-ios
//
//  Created by Matías Elorriaga on 9/4/17.
//  Copyright © 2017 melorriaga. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class MainAPIStore: MainStore {
    
    func getPokemonList(completionHandler: @escaping (APIResourceList?) -> Void) {
        let url = "http://pokeapi.co/api/v2/pokemon/"
        let parameters = ["limit": 150]
        
        Alamofire.request(url, parameters: parameters).responseObject { (response: DataResponse<APIResourceList>) in
            completionHandler(response.result.value)
        }
    }
    
}
