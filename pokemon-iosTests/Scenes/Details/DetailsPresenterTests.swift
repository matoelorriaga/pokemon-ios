//
//  DetailsPresenterTests.swift
//  pokemon-ios
//
//  Created by Matías Elorriaga on 8/4/17.
//  Copyright (c) 2017 melorriaga. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

@testable import pokemon_ios
import XCTest

class DetailsPresenterTests: XCTestCase {
    
    var sut: DetailsPresenter!
    
    override func setUp() {
        super.setUp()
        setupDetailsPresenter()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // setup
    
    func setupDetailsPresenter() {
        sut = DetailsPresenter()
    }
    
    // test doubles
    
    class DetailsPresenterOutputSpy: DetailsPresenterOutput {
        
        var displayGetPokemonDetailsCalled = false
        var viewModel: Details.GetPokemonDetails.ViewModel!
    
        func displayGetPokemonDetails(viewModel: Details.GetPokemonDetails.ViewModel) {
            displayGetPokemonDetailsCalled = true
            self.viewModel = viewModel
        }
    
    }
    
    // tests
    
    func testShouldCallPresenter() {
        // given
        let detailsPresenterOutputSpy = DetailsPresenterOutputSpy()
        sut.output = detailsPresenterOutputSpy
        
        // when
        let response = Details.GetPokemonDetails.Response()
        sut.presentGetPokemonDetails(response: response)
        
        // then
        XCTAssert(detailsPresenterOutputSpy.displayGetPokemonDetailsCalled)
    }
    
}
