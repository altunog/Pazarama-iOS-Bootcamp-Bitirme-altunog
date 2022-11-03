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
	
	private var products = [Product]()
	
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
	
	
	
}
