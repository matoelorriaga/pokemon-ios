//
//  DetailsInteractor.swift
//  pokemon-ios
//
//  Created by Matías Elorriaga on 5/4/17.
//  Copyright (c) 2017 melorriaga. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol DetailsInteractorInput
{
    func doSomething(request: Details.Something.Request)
}

protocol DetailsInteractorOutput
{
    func presentSomething(response: Details.Something.Response)
}

class DetailsInteractor: DetailsInteractorInput {
    
    var output: DetailsInteractorOutput!
    var worker: DetailsWorker!
    
    func doSomething(request: Details.Something.Request) {
        worker = DetailsWorker()
        worker.doSomeWork()
        
        let response = Details.Something.Response()
        output.presentSomething(response: response)
    }
    
}
