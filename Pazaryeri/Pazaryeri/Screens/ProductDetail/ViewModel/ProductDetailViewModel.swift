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
	func didUpdateCartSuccessful()
}

final class ProductDetailViewModel {
	
	weak var delegate: ProductDetailViewModelDelegate?
	
	private let db = Firestore.firestore()
	private let currentUser = Auth.auth().currentUser
	
	private(set) var cartCost: Double 		= .zero {
		didSet {
			delegate?.didFetchCartCost()
		}
	}
	private(set) var cart: [String: Int]?	= [:] {
		didSet {
			if let cart {
				cartCost = .zero
				fetchCartCost(cart)
			}
		}
	}
	
	func fetchCartContent() {
		guard let currentUser else { return }
		
		let cartRef = db.collection("users").document("\(currentUser.uid)")
		cartRef.getDocument(source: .default) { document, error in
			if let document {
				self.cart = document.get("cart") as? [String: Int]
				if let cart = self.cart, cart.isEmpty {
					self.cartCost = .zero
				}
			}
		}
	}
	
	func fetchCartCost(_ cart: [String: Int]) {
		let productsRef = db.collection("products")
		for (id, quantity) in cart {
			let product = productsRef.document(id)
			product.getDocument { document, _ in
				if let document, document.exists {
					guard let price = document.get("price") as? Double else { return }
					self.cartCost += price * Double(quantity)
				}
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
				else { self.delegate?.didUpdateCartSuccessful() }
			}
		} else {
			userRef.updateData([
				"cart.\(pid)": FieldValue.delete()
			]) { error in
				if let error { self.delegate?.errorDidOccur(error) }
				else { self.delegate?.didUpdateCartSuccessful() }
			}
		}
	}
	
}
