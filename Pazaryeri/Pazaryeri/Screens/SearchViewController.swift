//
//  SearchViewController.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 27.10.2022.
//

import UIKit
import PazaryeriAPI

class SearchViewController: UIViewController {

	private var collectionView: UICollectionView?
	private var viewModel 			= SearchViewModel()
	private let searchController 	= UISearchController(searchResultsController: nil)

	var filteredProducts: [Product] = []
	
	var isSearchBarEmpty: Bool {
	  return searchController.searchBar.text?.isEmpty ?? true
	}
	
	var isFiltering: Bool {
	  let searchBarScopeIsFiltering =
		searchController.searchBar.selectedScopeButtonIndex != 0
	  return searchController.isActive &&
		(!isSearchBarEmpty || searchBarScopeIsFiltering)
	}

	
    override func viewDidLoad() {
        super.viewDidLoad()

		configureViewController()
		configureCollectionView()
		viewModel.fetchProducts()
		
		searchController.searchBar.scopeButtonTitles = ProductCategory.allCases
		  .map { $0.rawValue }
		searchController.searchBar.delegate = self

    }

	private func configureViewController() {
		title = "Search"
		view.backgroundColor = .white
		searchController.searchResultsUpdater = self
		searchController.obscuresBackgroundDuringPresentation = false
		searchController.searchBar.placeholder = "Search products"
		navigationItem.searchController = searchController
		definesPresentationContext = true

		
	}
	
	private func configureCollectionView() {
		collectionView = UICollectionView(frame: view.bounds,
										  collectionViewLayout: UIHelper.createTwoColumnFlowLayout())
		guard let collectionView = collectionView else { return }
		collectionView.register(SearchCell.self, forCellWithReuseIdentifier: SearchCell.identifier)
		collectionView.delegate = self
		collectionView.dataSource = self
		view.addSubview(collectionView)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.pinToEdges(of: view)
	}

	func filterContentForSearchText(_ searchText: String,
									category: ProductCategory? = nil) {
		filteredProducts = viewModel.products.filter { (product: Product) -> Bool in
			let doesCategoryMatch = category == .all || product._category == category?.rawValue
		
		if isSearchBarEmpty {
		  return doesCategoryMatch
		} else {
		  return doesCategoryMatch && product._title.lowercased()
			.contains(searchText.lowercased())
		}
	  }
	  
	  collectionView?.reloadData()
	}
	
	private func goDetailScreen(product: Product) {
		let detailVC = ProductDetailViewController(product: product)
		navigationController?.pushViewController(detailVC, animated: true)
	}
}

extension SearchViewController: UISearchResultsUpdating {
	func updateSearchResults(for searchController: UISearchController) {
	  let searchBar = searchController.searchBar
	  let category = ProductCategory(rawValue:
		searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex])
	  filterContentForSearchText(searchBar.text!, category: category)
	}

}

extension SearchViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		collectionView.deselectItem(at: indexPath, animated: true)
		if isFiltering {
			goDetailScreen(product: filteredProducts[indexPath.row])
		} else {
			goDetailScreen(product: viewModel.products[indexPath.row])
		}
		
	}
}

extension SearchViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar,
	  selectedScopeButtonIndexDidChange selectedScope: Int) {
	let category = ProductCategory(rawValue:
	  searchBar.scopeButtonTitles![selectedScope])
	filterContentForSearchText(searchBar.text!, category: category)
  }
}

// MARK: - UICollectionViewDataSource
extension SearchViewController: UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if isFiltering {
			return filteredProducts.count
		}
		return viewModel.products.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCell.identifier, for: indexPath) as! SearchCell
		let product: Product
		if isFiltering {
			product = filteredProducts[indexPath.row]
		} else {
			product = viewModel.products[indexPath.row]
		}
		
		cell.imageView.downloadImage(from: product._image)
		cell.titleLabel.text = product._title
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
		
		collectionView.reloadItems(at: [indexPath])
	}

}
