//
//  ProductsViewModel.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 2.11.2022.
//

import Foundation
import PazaryeriAPI

protocol ProductsViewModelDelegate: AnyObject {
	func didOccurError(_ error: Error)
	func didFetchProducts()
}

final class ProductsViewModel {
	weak var delegate: ProductsViewModelDelegate?
	
	private(set) var products = [Product]() {
		didSet {
			for item in products {
				productsByCategory[item.category ?? "unavailable", default: []].append(item)
				print(productsByCategory)
			}

		}
	}

	private(set) var productsByCategory = [String: [Product]]()
	
	func fetchProducts() {
		pazaryeriServiceProvider.request(.getProducts) { result in
			switch result {
			case .failure(let error):
				self.delegate?.didOccurError(error)
			case .success(let response):
				do {
					let products = try JSONDecoder().decode([Product].self, from: response.data)
					self.products = products
					self.delegate?.didFetchProducts()
				} catch {
					self.delegate?.didOccurError(error)
				}
			}
		}
	}
	
	func getNumberOfProducts(for section: PYSectionView) -> Int {
		return productsByCategory[section.title.lowercased()]?.count ?? .zero
	}
	
	func getProduct(for section: PYSectionView, at indexPath: IndexPath) -> Product? {
		return productsByCategory[section.title.lowercased()]?[indexPath.item]
	}
	
	
}
