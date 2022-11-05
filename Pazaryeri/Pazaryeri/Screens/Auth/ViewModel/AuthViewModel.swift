//
//  AuthViewModel.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 3.11.2022.
//

import Foundation
import PazaryeriAPI
import FirebaseAuth
import FirebaseFirestore

protocol AuthViewModelDelegate: AnyObject {
	func didOccurError(_ error: Error)
	func didSignUpSuccessful()
	func didSignInSuccessful()
}

final class AuthViewModel {
	weak var delegate: AuthViewModelDelegate?
	
	private let db = Firestore.firestore()
	
	func signUp(username: String, email: String, password: String) {
		Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
			if let error {
				self.delegate?.didOccurError(error)
				return
			}
			
			let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
			changeRequest?.displayName = username
			changeRequest?.commitChanges { error in
				if let error {
					self.delegate?.didOccurError(error)
					return
				}
			}
			
			guard let uid = authResult?.user.uid,
				  let email = authResult?.user.email else { return }
			let prod = Product(id: 1, title: "macbook", price: 999.90, description: "macbook pro 14inch", category: "electronics", image: nil, rating: nil)
			let _cart = Cart(products: [ProductCount(product: prod, quantity: 2), ProductCount(product: prod, quantity: 5)])
			let user = User(id: uid,
							username: username,
							email: email,
							cart: _cart,
							previousOrders: [_cart],
							activeOrders: [_cart])
			
			let userAsEncoded = user.dictionary
			self.db.collection("users").document(uid).setData(userAsEncoded) { error in
				if let error {
					self.delegate?.didOccurError(error)
					return
				}
				self.delegate?.didSignUpSuccessful()
			}
		}
	}
	
	func signIn(email: String, password: String) {
		Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
			if let error {
				self.delegate?.didOccurError(error)
				return
			}
			self.delegate?.didSignInSuccessful()
		}
	}
}

extension AuthViewModelDelegate {
	func didSignUpSuccessful() {}
	func didSignInSuccessful() {}
}
