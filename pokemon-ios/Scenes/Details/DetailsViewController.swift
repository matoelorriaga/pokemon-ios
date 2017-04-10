//
//  DetailsViewController.swift
//  pokemon-ios
//
//  Created by Matías Elorriaga on 5/4/17.
//  Copyright (c) 2017 melorriaga. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit
import AlamofireImage

protocol DetailsViewControllerInput {
    func displayGetPokemonDetails(viewModel: Details.GetPokemonDetails.ViewModel)
}

protocol DetailsViewControllerOutput {
    func doGetPokemonDetails(request: Details.GetPokemonDetails.Request)
}

class DetailsViewController: UIViewController, DetailsViewControllerInput {
    
    var output: DetailsViewControllerOutput!
    var router: DetailsRouter!
    
    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var baseExperienceLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var pokemonViewCollection: [UIView]!
    
    var pokemonId: Int?
    var pokemonName: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DetailsConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavigationControllerTitle()
        
        getPokemonDetails()
    }
    
    private func initNavigationControllerTitle() {
        title = "\(pokemonName!) (#\(pokemonId!))"
    }
    
    // to interactor
    
    func getPokemonDetails() {
        let request = Details.GetPokemonDetails.Request(id: pokemonId!)
        output.doGetPokemonDetails(request: request)
    }
    
    // from presenter
    
    func displayGetPokemonDetails(viewModel: Details.GetPokemonDetails.ViewModel) {
        if let pokemon = viewModel.pokemon {
            if let frontDefault = pokemon.sprites?.frontDefault {
                frontImageView.af_setImage(withURL: URL(string: frontDefault)!)
            }
            if let backDefault = pokemon.sprites?.backDefault {
                backImageView.af_setImage(withURL: URL(string: backDefault)!)
            }
            idLabel.text = "id: \(pokemon.id!)"
            nameLabel.text = "name: \(pokemon.name!)"
            heightLabel.text = "height: \(pokemon.height!)"
            weightLabel.text = "weight: \(pokemon.weight!)"
            baseExperienceLabel.text = "base experience: \(pokemon.baseExperience!)"
            pokemonViewCollection.forEach { $0.isHidden = false}
        }
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
}
