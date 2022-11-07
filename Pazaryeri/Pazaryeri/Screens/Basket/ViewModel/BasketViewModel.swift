//
//  BasketViewModel.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 7.11.2022.
//

import Foundation
import PazaryeriAPI
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol BasketViewModelDelegate: AnyObject {
	func errorDidOccur(_ error: Error)
	func didFetchProductsInCart()
	func didFetchCostByItemCount()
	func didUpdateCartSuccessful()
	func didCheckoutSuccessful()
}

final class BasketViewModel {
	weak var delegate: BasketViewModelDelegate?
	
	private let db = Firestore.firestore()
	private let currentUser = Auth.auth().currentUser
	
	private var isCheckout = false
	
	private(set) var productsInCart: [Product] = [] {
		didSet {
			if productsInCart.count == cart?.count {
				delegate?.didFetchProductsInCart()
			}
		}
	}
	
	private(set) var costByItemCount: [String: Double] = [:] {
		didSet {
			if costByItemCount.count == cart?.count {
				delegate?.didFetchCostByItemCount()
			}
		}
	}
	
	private(set) var cart: [String: Int]?	= [:] {
		didSet {
			if let cart, cart.isEmpty {
				costByItemCount = [:]
			} else if let cart {
				fetchCostByItemCount(cart)
				fetchProductsInCart(cart)
			}
		}
	}
	
	// fill cart
	func fetchCartContent() {
		guard let currentUser else { return }
		
		let cartRef = db.collection("users").document("\(currentUser.uid)")
		cartRef.getDocument(source: .default) { document, error in
			if let document {
				self.cart = document.get("cart") as? [String: Int]
			}
		}
	}
	
	// fill costByItemCount
	func fetchCostByItemCount(_ cart: [String: Int]) {
		let productsRef = db.collection("products")
		
		for (id, quantity) in cart {
			let product = productsRef.document(id)
			
			product.getDocument { document, _ in
				if let document, document.exists {
					var cost: Double = .zero
					guard let price = document.get("price") as? Double else { return }
					cost = price * Double(quantity)
					self.costByItemCount[id, default: .zero] = cost
				} else {
					self.costByItemCount = [:]
				}
			}
		}
	}
	
	// fill productsInCart
	func fetchProductsInCart(_ cart: [String: Int]) {
		let productsRef = db.collection("products")
		
		for (id, _) in cart {
			let docRef = productsRef.document(id)
			docRef.getDocument(as: Product.self) { result in
				switch result {
				case .failure(let error):
					self.delegate?.errorDidOccur(error)
				case .success(let product):
					if !self.productsInCart.contains(product) {
						self.productsInCart.append(product)
					}
				}
			}
		}
	}
	
	// update cart in firestore using stepper
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
				else {
					self.delegate?.didUpdateCartSuccessful()
					if self.productsInCart.isEmpty && self.isCheckout {
						self.delegate?.didCheckoutSuccessful()
					}
				}
			}
		}
	}
	
	func checkout() {
		isCheckout = true
		let productsSnapshot = productsInCart
		for product in productsSnapshot {
			updateCart(withProductId: product._id, quantity: 0)
		}
	}
	
	var totalCost: Double {
		var total: Double = .zero
		for (_, cost) in costByItemCount {
			total += cost
		}
		return total
	}
	
	var numberOfRows: Int {
		productsInCart.count
	}
	
	func getProductIndexPath(by id: Int) -> IndexPath {
		let index = productsInCart.firstIndex { product in
			product._id == id
		}
		return IndexPath(row: index!, section: 0)
	}
	
	func productForIndexPath(_ indexPath: IndexPath) -> Product {
		productsInCart[indexPath.row]
	}
	
	func removeProduct(at index: Int) {
		productsInCart.remove(at: index)
	}
	
}
