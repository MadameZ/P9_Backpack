//
//  TableViewExtension.swift
//  Backpack
//
//  Created by Caroline Zaini on 31/07/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

// MARK: - TableView

extension CityListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? selectedCitiesArray.count : citiesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        let index = indexPath.row
        let country = isSearching ? selectedCitiesArray[index] : citiesArray[index]
        cell.textLabel?.text = country.name
//        cell.contentView.backgroundColor = UIColor(red: 0 / 255, green: 68 / 255, blue: 108 / 255, alpha: 1)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Something is selected")
        
        var selectedCity: City
        
        if isSearching {
            selectedCity = selectedCitiesArray[indexPath.row]
        } else {
            selectedCity = citiesArray[indexPath.row]
        }
        
        let selectedCityId = String(selectedCity.id)
        print("selectedCity" + selectedCity.name)
        

        
        // Save city cityId in UserDefaults :
        SettingService.cityID = selectedCityId
        
        // Pass the data's object City with protocole :
        delegate?.passCity(data: selectedCity)
        
        self.dismiss(animated: true, completion: nil)
    }
}
