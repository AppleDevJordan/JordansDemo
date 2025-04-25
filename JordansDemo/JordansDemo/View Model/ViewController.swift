//
//  ViewController.swift
//  JordansDemo
//
//  Created by Jordan McKnight on 4/25/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UISearchResultsUpdating {
    
    private let tableView = UITableView()
    private var countries: [Country] = [] // Original list
    private var filteredCountries: [Country] = [] // Filtered list
    private var searchController: UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Countries"
        view.backgroundColor = .white
        
        setupTableView()
        setupSearchController()
        
        // Fetch the data
        APIService.shared.fetchCountries { [weak self] list in
            guard let self = self, !list.isEmpty else {
                DispatchQueue.main.async {
                    self?.showAlert(title: "Error", message: "No countries found!")
                }
                return
            }
            self.countries = list
            self.filteredCountries = list // Initialize filteredCountries with the full list
            DispatchQueue.main.async { self.tableView.reloadData() }
        }
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CountryTableViewCell.self, forCellReuseIdentifier: "CountryCell")
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

    private func setupSearchController() {
        // Create the search controller
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search by Country, City, or State"
        
        // Add the search bar to the navigation bar
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let country = filteredCountries[indexPath.row]
        let viewModel = CountryViewModel(country: country)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as? CountryTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: viewModel)
        return cell
    }

    // MARK: UISearchResultsUpdating

    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text?.lowercased(), !query.isEmpty else {
            filteredCountries = countries // Reset to full list when search is cleared
            tableView.reloadData()
            return
        }
        
        // Filter the countries array based on the query
        filteredCountries = countries.filter { country in
            country.name.lowercased().contains(query) ||
            country.capital.lowercased().contains(query) ||
            country.region.lowercased().contains(query)
        }
        
        // Refresh the table view with filtered results
        tableView.reloadData()
    }
    
    // MARK: Error Handling

    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
}

// MARK: - ViewModel for TableView

struct CountryViewModel {
    let nameAndRegion: String
    let code: String
    let capital: String

    init(country: Country) {
        self.nameAndRegion = "\(country.name), \(country.region)"
        self.code = country.code
        self.capital = country.capital
    }
}
