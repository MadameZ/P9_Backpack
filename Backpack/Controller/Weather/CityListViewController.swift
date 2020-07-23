//
//  CityListViewController.swift
//  Backpack
//
//  Created by Caroline Zaini on 23/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

class CityListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var citiesJSON: [City] = []
    var isSearching = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.setupGradient()
        
//        tableView.delegate = self
//        tableView.dataSource = self
//        
//        searchBar.delegate = self
        
    }
    
    private func getCityList() {
        
        /// check for the file
        guard let url = Bundle.main.url(forResource: "city.lit", withExtension: "json") else { return }
        /// check for the date
        guard let data = try? Data(contentsOf: url) else { return }
        /// check for the json decoder
//        guard let json = try? JSONDecoder().decode(City.self, from: data) else { return }
        
        
        
    }
    
    
    
    



}
