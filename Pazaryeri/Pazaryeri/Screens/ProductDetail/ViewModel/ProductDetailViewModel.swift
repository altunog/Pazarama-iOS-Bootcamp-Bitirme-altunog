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
	private(set) var cart: [String: Int]? = [:]
	
	func fetchCartContent() {
		guard let currentUser else { return }
		
		let cartRef = db.collection("users").document("\(currentUser.uid)")
		cartRef.getDocument(source: .default) { document, error in
			if let document {
				self.cart = document.get("cart") as? [String: Int]
				print(self.cart)
			}
		}
		
	}
	
	func updateCart(withProductId pid: Int, quantity: Int) {
		guard let currentUser else { return }
		
		let userRef = db.collection("users").document(currentUser.uid)
		if quantity > 0 {
			userRef.updateData([
				"cart.\(pid)": quantity
			]) { error in
				if let error { self.delegate?.errorDidOccur(error) }
				else { self.delegate?.didUpdateCartSuccesful() }
			}
		} else {
			userRef.updateData([
				"cart.\(pid)": FieldValue.delete()
			]) { error in
				if let error { self.delegate?.errorDidOccur(error) }
				else { self.delegate?.didUpdateCartSuccesful() }
			}
		}
	}
	
}
