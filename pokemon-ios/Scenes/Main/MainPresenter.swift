//
//  MainPresenter.swift
//  pokemon-ios
//
//  Created by Matías Elorriaga on 4/4/17.
//  Copyright (c) 2017 melorriaga. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import Foundation

protocol MainPresenterInput {
    func presentGetPokemonList(response: Main.GetPokemonList.Response)
}

protocol MainPresenterOutput: class {
    func displayGetPokemonList(viewModel: Main.GetPokemonList.ViewModel)
}

class MainPresenter: MainPresenterInput {
    
    weak var output: MainPresenterOutput!
    
    func presentGetPokemonList(response: Main.GetPokemonList.Response) {
        let pokemonList = getPokemonListFromApiResourceList(apiResourceList: response.apiResourceList)
        let viewModel = Main.GetPokemonList.ViewModel(pokemonList: pokemonList)
        output.displayGetPokemonList(viewModel: viewModel)
    }
    
    private func getPokemonListFromApiResourceList(apiResourceList: APIResourceList?) -> [Pokemon] {
        if let results = apiResourceList?.results {
            return results.map({
                return Pokemon(JSON: [
                    "id": Int($0.url!.components(separatedBy: "/")[6])!,
                    "name": $0.name!
                ])!
            })
        } else {
            return []
        }
    }
    
}
