//
//  SearchViewController.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 27.10.2022.
//

import UIKit

class SearchViewController: UIViewController {

	let searchController = UISearchController(searchResultsController: nil)

	
    override func viewDidLoad() {
        super.viewDidLoad()

		title = "Search"
		view.backgroundColor = .systemBlue
    }


}
