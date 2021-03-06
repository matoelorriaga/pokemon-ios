//
//  MainConfigurator.swift
//  pokemon-ios
//
//  Created by Matías Elorriaga on 4/4/17.
//  Copyright (c) 2017 melorriaga. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

extension MainViewController: MainPresenterOutput {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue: segue)
    }
}

extension MainInteractor: MainViewControllerOutput {}

extension MainPresenter: MainInteractorOutput {}

class MainConfigurator {
    
    static let sharedInstance = MainConfigurator()
    
    private init() {}
    
    func configure(viewController: MainViewController) {
        let router = MainRouter()
        router.viewController = viewController
        
        let presenter = MainPresenter()
        presenter.output = viewController
        
        let interactor = MainInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
    
}
