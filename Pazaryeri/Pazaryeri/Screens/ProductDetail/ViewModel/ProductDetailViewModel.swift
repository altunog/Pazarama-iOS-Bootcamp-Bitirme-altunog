//
//  ProductDetailViewModel.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 5.11.2022.
//

import Foundation
import PazaryeriAPI
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol ProductDetailViewModelDelegate: AnyObject {
	func errorDidOccur(_ error: Error)
	func didFetchCartCost()
	func didUpdateCartSuccesful()
}

final class ProductDetailViewModel {
	
	weak var delegate: ProductDetailViewModelDelegate?
	
	private let db = Firestore.firestore()
	private let currentUser = Auth.auth().currentUser
	
	private(set) var cartCost = Double()
	
	
	func fetchCartCost() {
		guard let currentUser else { return }
		
		let userRef = db.collection("users").document(currentUser.uid)
		userRef.getDocument(as: User.self) { result in
			switch result {
			case .failure(let error):
				self.delegate?.errorDidOccur(error)
			case .success(let user):
//				self.cartCost = user.totalCost
				self.delegate?.didFetchCartCost()
			}
		}
	}
	
	func updateCart(withProduct product: Product, quantity: Int) {
		guard let currentUser else { return }
		
		let userRef = db.collection("users").document(currentUser.uid)
		if quantity > 0 {
			userRef.updateData([
				"cart.productId": quantity
			]) { error in
				if let error { self.delegate?.errorDidOccur(error) }
				else { self.delegate?.didUpdateCartSuccesful() }
			}
		} /*else {
			userRef.updateData([
				"cart": FieldValue.arrayRemove([product, quantity])
			]) { error in
				if let error { self.delegate?.errorDidOccur(error) }
				else { self.delegate?.didUpdateCartSuccesful() }
			}
		}*/
	}
	
}
