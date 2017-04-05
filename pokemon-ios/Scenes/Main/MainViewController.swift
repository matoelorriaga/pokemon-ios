//
//  MainViewController.swift
//  pokemon-ios
//
//  Created by Matías Elorriaga on 4/4/17.
//  Copyright (c) 2017 melorriaga. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol MainViewControllerInput
{
  func displaySomething(viewModel: Main.Something.ViewModel)
}

protocol MainViewControllerOutput
{
  func doSomething(request: Main.Something.Request)
}

class MainViewController: UIViewController, MainViewControllerInput
{
  var output: MainViewControllerOutput!
  var router: MainRouter!
  
  // MARK: - Object lifecycle
  
  override func awakeFromNib()
  {
    super.awakeFromNib()
    MainConfigurator.sharedInstance.configure(viewController: self)
  }
  
  // MARK: - View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomethingOnLoad()
  }
  
  // MARK: - Event handling
  
  func doSomethingOnLoad()
  {
    // NOTE: Ask the Interactor to do some work
    
    let request = Main.Something.Request()
    output.doSomething(request: request)
  }
  
  // MARK: - Display logic
  
  func displaySomething(viewModel: Main.Something.ViewModel)
  {
    // NOTE: Display the result from the Presenter
    
    // nameTextField.text = viewModel.name
  }
}