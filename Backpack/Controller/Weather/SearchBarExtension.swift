//
//  SearchBarExtension.swift
//  Backpack
//
//  Created by Caroline Zaini on 31/07/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

// MARK: - SearchBar

extension CityListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            isSearching = false
            tableView.reloadData()
        } else {
            isSearching = true
            selectedCitiesArray = citiesArray.filter({$0.name.lowercased().contains(searchText.lowercased())})
            tableView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        /// close the keyboard when search button clicked
        view.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        tableView.reloadData()
    }
    
}
