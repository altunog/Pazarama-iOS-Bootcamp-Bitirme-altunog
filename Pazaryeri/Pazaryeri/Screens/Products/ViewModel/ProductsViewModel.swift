//
//  ProductsViewModel.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 2.11.2022.
//

import Foundation
import PazaryeriAPI

protocol ProductsViewModelDelegate: AnyObject {
	func errorDidOccur(_ error: Error)
	func didFetchProducts()
	func didFetchSingleProduct(_ product: Product)
}

final class ProductsViewModel {
	weak var delegate: ProductsViewModelDelegate?
	
	private(set) var products = [Product]() {
		didSet {
			for item in products {
				productsByCategory[item.category ?? "unavailable", default: []].append(item)
			}
		}
	}

	private(set) var productsByCategory = [String: [Product]]()
	
	func fetchProducts() {
		pazaryeriServiceProvider.request(.getProducts) { result in
			switch result {
			case .failure(let error):
				self.delegate?.errorDidOccur(error)
			case .success(let response):
				do {
					let products = try JSONDecoder().decode([Product].self, from: response.data)
					self.products = products
					self.delegate?.didFetchProducts()
				} catch {
					self.delegate?.errorDidOccur(error)
				}
			}
		}
	}
	
	func fetchSingleProduct(withId id: Int) {
		pazaryeriServiceProvider.request(.getSingleProduct(id: id)) { result in
			
			switch result {
				
			case .failure(let error):
				self.delegate?.errorDidOccur(error)
			case .success(let response):
				do {
					let product = try JSONDecoder().decode(Product.self, from: response.data)
					self.delegate?.didFetchSingleProduct(product)
				} catch {
					self.delegate?.errorDidOccur(error)
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
