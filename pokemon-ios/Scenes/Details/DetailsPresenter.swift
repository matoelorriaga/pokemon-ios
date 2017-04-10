//
//  DetailsPresenter.swift
//  pokemon-ios
//
//  Created by Matías Elorriaga on 5/4/17.
//  Copyright (c) 2017 melorriaga. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import Foundation

protocol DetailsPresenterInput {
    func presentGetPokemonDetails(response: Details.GetPokemonDetails.Response)
}

protocol DetailsPresenterOutput: class {
    func displayGetPokemonDetails(viewModel: Details.GetPokemonDetails.ViewModel)
}

class DetailsPresenter: DetailsPresenterInput {
    
    weak var output: DetailsPresenterOutput!
    
    func presentGetPokemonDetails(response: Details.GetPokemonDetails.Response) {
        let viewModel = Details.GetPokemonDetails.ViewModel(pokemon: response.pokemon)
        output.displayGetPokemonDetails(viewModel: viewModel)
    }
    
}
