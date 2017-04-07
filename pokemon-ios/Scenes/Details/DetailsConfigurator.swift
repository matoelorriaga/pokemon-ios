//
//  DetailsConfigurator.swift
//  pokemon-ios
//
//  Created by Matías Elorriaga on 5/4/17.
//  Copyright (c) 2017 melorriaga. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

extension DetailsViewController: DetailsPresenterOutput {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue: segue)
    }
    
}

extension DetailsInteractor: DetailsViewControllerOutput {}

extension DetailsPresenter: DetailsInteractorOutput {}

class DetailsConfigurator {
    
    static let sharedInstance = DetailsConfigurator()
    
    private init() {}
    
    func configure(viewController: DetailsViewController) {
        let router = DetailsRouter()
        router.viewController = viewController
        
        let presenter = DetailsPresenter()
        presenter.output = viewController
        
        let interactor = DetailsInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
    
}
