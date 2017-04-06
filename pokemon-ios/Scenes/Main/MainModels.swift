//
//  MainModels.swift
//  pokemon-ios
//
//  Created by Matías Elorriaga on 4/4/17.
//  Copyright (c) 2017 melorriaga. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

struct Main
{
    struct GetPokemonList
    {
        struct Request
        {
        }
        struct Response
        {
            var apiResourceList: APIResourceList?
        }
        struct ViewModel
        {
            var pokemonList: [Pokemon]
        }
    }
}
