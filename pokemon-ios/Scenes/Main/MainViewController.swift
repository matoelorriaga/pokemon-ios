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

protocol MainViewControllerInput {
    func displayGetPokemonList(viewModel: Main.GetPokemonList.ViewModel)
}

protocol MainViewControllerOutput {
    func doGetPokemonList(request: Main.GetPokemonList.Request)
}

class MainViewController: UIViewController, MainViewControllerInput {
    
    var output: MainViewControllerOutput!
    var router: MainRouter!
    
    @IBOutlet weak var tableView: UITableView!
    
    let refreshControl = UIRefreshControl()
    
    var pokemonList = [Pokemon]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        MainConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTableView()
        initRefreshControl()
        
        getPokemonList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        smoothlyDeselectRows(tableView: tableView)
    }
    
    private func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }
    
    private func initRefreshControl() {
        refreshControl.tintColor = UIColor(hex: "#3367B0")
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        refreshControl.beginRefreshing()
        tableView.setContentOffset(CGPoint(x: 0, y: -refreshControl.frame.size.height), animated: true)
    }
    
    // events
    
    func refresh(_ refreshControl: UIRefreshControl) {
        getPokemonList()
    }
    
    // to interactor
    
    func getPokemonList() {
        let request = Main.GetPokemonList.Request()
        output.doGetPokemonList(request: request)
    }
    
    // from presenter
    
    func displayGetPokemonList(viewModel: Main.GetPokemonList.ViewModel) {
        self.pokemonList = viewModel.pokemonList
        
        tableView.reloadData()
        stopRefreshing()
    }
    
    private func stopRefreshing() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, h:mm a"
        
        let now = formatter.string(from: Date())
        refreshControl.attributedTitle = NSAttributedString(string: "Last update: \(now)")
        refreshControl.endRefreshing()
    }
    
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.navigateToDetailsScene()
    }
    
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = pokemonList[indexPath.row].name
        return cell
    }
    
}
