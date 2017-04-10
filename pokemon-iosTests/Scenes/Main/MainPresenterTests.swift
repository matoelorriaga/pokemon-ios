//
//  MainPresenterTests.swift
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

class MainPresenterTests: XCTestCase {
    
    var sut: MainPresenter!
    
    override func setUp() {
        super.setUp()
        setupMainPresenter()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // setup
    
    func setupMainPresenter() {
        sut = MainPresenter()
    }
    
    // test doubles
    
    class MainPresenterOutputSpy: MainPresenterOutput {
        
        var displayGetPokemonListCalled = false
        var mainGetPokemonListViewModel: Main.GetPokemonList.ViewModel!
        
        func displayGetPokemonList(viewModel: Main.GetPokemonList.ViewModel) {
            displayGetPokemonListCalled = true
            mainGetPokemonListViewModel = viewModel
        }
    
    }
    
    // tests
    
    func testSutShouldCallPresenter() {
        // given
        let mainPresenterOutputSpy = MainPresenterOutputSpy()
        sut.output = mainPresenterOutputSpy
        
        // when
        let response = Main.GetPokemonList.Response(apiResourceList: nil)
        sut.presentGetPokemonList(response: response)
        
        // then
        XCTAssert(mainPresenterOutputSpy.displayGetPokemonListCalled)
    }
    
    func testSutShouldFormatResponseFromInteractor() {
        // given
        let mainPresenterOutputSpy = MainPresenterOutputSpy()
        sut.output = mainPresenterOutputSpy
        
        let json = [
            "results": [
                [
                    "url": "http://pokeapi.co/api/v2/pokemon/1/",
                    "name": "bulbasaur"
                ],
                [
                    "url": "http://pokeapi.co/api/v2/pokemon/2/",
                    "name": "ivysaur"
                ],
                [
                    "url": "http://pokeapi.co/api/v2/pokemon/3/",
                    "name": "venusaur"
                ]
            ]
        ]
        let apiResourceList = APIResourceList(JSON: json)
        
        // when
        let response = Main.GetPokemonList.Response(apiResourceList: apiResourceList)
        sut.presentGetPokemonList(response: response)
        
        // then
        let returnedPokemonList = mainPresenterOutputSpy.mainGetPokemonListViewModel.pokemonList
        let expectedPokemonList = [
            Pokemon(JSON: ["id": 1, "name": "bulbasaur"]),
            Pokemon(JSON: ["id": 2, "name": "ivysaur"]),
            Pokemon(JSON: ["id": 3, "name": "venusaur"])
        ]
        
        XCTAssertEqual(returnedPokemonList[0].id, expectedPokemonList[0]?.id)
        XCTAssertEqual(returnedPokemonList[0].name, expectedPokemonList[0]?.name)
        XCTAssertEqual(returnedPokemonList[1].id, expectedPokemonList[1]?.id)
        XCTAssertEqual(returnedPokemonList[1].name, expectedPokemonList[1]?.name)
        XCTAssertEqual(returnedPokemonList[2].id, expectedPokemonList[2]?.id)
        XCTAssertEqual(returnedPokemonList[2].name, expectedPokemonList[2]?.name)
    }
    
}
