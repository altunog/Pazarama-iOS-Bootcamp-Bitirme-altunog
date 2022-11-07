//
//  SearchViewModel.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 7.11.2022.
//

import Foundation
import PazaryeriAPI
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol SearchViewModelDelegate: AnyObject {
	func errorDidOccur(_ error: Error)
	func didFetchSearchProducts()
}

final class SearchViewModel {
	
	weak var delegate: SearchViewModelDelegate?
	let db = Firestore.firestore()
	
	private(set) var products: [Product] = []
	
	func fetchProducts() {
		db.collection("products").getDocuments { querySnapshot, error in
			if let error {
				self.delegate?.errorDidOccur(error)
				return
			} else {
				for document in querySnapshot!.documents {
					do {
						try self.products.append(document.data(as: Product.self))
					} catch {
						self.delegate?.errorDidOccur(error)
					}
				}
				self.delegate?.didFetchSearchProducts()
			}
		}
	}
	
	func productForCell(at indexPath: IndexPath) -> Product? {
		products[indexPath.row]
	}
	
}
