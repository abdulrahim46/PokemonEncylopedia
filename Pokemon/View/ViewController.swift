//
//  ViewController.swift
//  Pokemon
//
//  Created by Abdul Rahim on 11/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let searchBar = UISearchBar()
    var tableview = UITableView()
    public var pokemonViewModel: PokemanViewModel?
    private var dataSource = [PokemonModel]?.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        pokemonViewModel?.getAPIData(param: ["client_id":Constants.APIKeys.kClientKey,"page" : 1, "query" : "dog"], completion: { (model, error) in
            if let _ = error {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: error?.message, preferredStyle: UIAlertController.Style.alert)
                    self.present(alert, animated: true, completion: nil)
                }
            } else {
                if let modelUW = model {
                    print(modelUW)
                   // self.dataSource = modelUW.results
                    DispatchQueue.main.async {
                      // self.collectionView?.reloadData()
                    }
                }
            }
        })
    }
    
    // MARK: - Selectors
    
    @objc func handleShowSearchBar() {
        searchBar.becomeFirstResponder()
        search(shouldShow: true)
    }
    
    // MARK: - Helper Functions
    
    func configureUI() {
        view.backgroundColor = .white
        
        searchBar.sizeToFit()
        searchBar.delegate = self
        
        navigationController?.navigationBar.barTintColor = .systemBackground
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.title = "Pokémon Encylopedia"
        showSearchBarButton(shouldShow: true)
        
        view.addSubview(tableview)
        tableview.dataSource = self
        tableview.delegate = self
        tableview.rowHeight = 100
        tableview.register(PokemonTableViewCell.self,forCellReuseIdentifier: "PokemonTableViewCell")
        tableview.pin(to: view)
    }
    

    
    
    func showSearchBarButton(shouldShow: Bool) {
        if shouldShow {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                                target: self,
                                                                action: #selector(handleShowSearchBar))
        } else {
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    func search(shouldShow: Bool) {
        showSearchBarButton(shouldShow: !shouldShow)
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
    }
    
}

extension ViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("Search bar editing did begin..")
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("Search bar editing did end..")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(shouldShow: false)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Search text is \(searchText)")
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "PokemonTableViewCell") as! PokemonTableViewCell
        cell.set()
        return cell
    }
    
}

