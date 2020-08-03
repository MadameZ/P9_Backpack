//
//  CityListViewController.swift
//  Backpack
//
//  Created by Caroline Zaini on 23/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

class CityListViewController: UIViewController {
    
    @IBOutlet weak var cancelLabel: UILabel!
    @IBOutlet weak var closeIv: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // Array of cities
    var citiesArray: [City] = []
    var selectedCitiesArray: [City] = []

    var isSearching = false
    
    var delegate: ReceiveDataDelegate?


    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setupGradient()
        
        getCityList()
        
        tapGestureDismiss()
        tapGestureCancel()
     
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
    }
    
    
    private func getCityList() {
        
        // check for the file
        guard let url = Bundle.main.url(forResource: "city.list", withExtension: "json") else { return }
        // check for the data
        guard let data = try? Data(contentsOf: url) else { return }
        // check for the json decoder
        guard let json = try? JSONDecoder().decode(Cities.self, from: data) else { return }
       
        // Append cities to citiesArray
        for city in json {
            let cityID = city.id
            let cityName = city.name
            let cityCountry = city.country
            let city = City(id: cityID, name: cityName, country: cityCountry)
            
            citiesArray.append(city)
        }
        tableView.reloadData()
        
    }
    
    // MARK: - Tap Gesture
  
    func tapGestureDismiss() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        closeIv.isUserInteractionEnabled = true
        closeIv.addGestureRecognizer(tapGestureRecognizer)
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    func tapGestureCancel() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelTapped(tapGestureRecognizer:)))
        cancelLabel.isUserInteractionEnabled = true
        cancelLabel.addGestureRecognizer(tapGestureRecognizer)
    }
    @objc func labelTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        isSearching = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
        tableView.reloadData()
    }
    
}


