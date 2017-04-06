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

import UIKit

protocol DetailsPresenterInput
{
    func presentSomething(response: Details.Something.Response)
}

protocol DetailsPresenterOutput: class
{
    func displaySomething(viewModel: Details.Something.ViewModel)
}

class DetailsPresenter: DetailsPresenterInput {
    
    weak var output: DetailsPresenterOutput!
    
    func presentSomething(response: Details.Something.Response) {
        let viewModel = Details.Something.ViewModel()
        output.displaySomething(viewModel: viewModel)
    }
    
}
