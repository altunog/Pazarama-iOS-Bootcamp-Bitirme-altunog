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
	private let db = Firestore.firestore()
	
	private(set) var products: [Product] = []
	
	func fetchProducts() {
		
	}
	
}
