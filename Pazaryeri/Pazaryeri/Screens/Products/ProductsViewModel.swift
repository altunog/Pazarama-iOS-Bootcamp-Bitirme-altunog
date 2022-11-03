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
				productCountByCategory[item.category?.lowercased() ?? "unavailable", default: 0] += 1
			}
		}
	}
	private(set) var productCountByCategory = [String: Int]()
	
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
	
	func getNumberOfItems(for section: PYSectionView) -> Int {
		return productCountByCategory[section.title.lowercased()] ?? .zero
	}
	
	
}
