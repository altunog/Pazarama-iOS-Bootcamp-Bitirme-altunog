//
//  AuthViewModel.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 3.11.2022.
//

import Foundation
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
			
			guard let uid = authResult?.user.uid,
				  let email = authResult?.user.email else { return }
			
			let user = User(id: uid,
							username: username,
							email: email,
							cart: Cart(products: [:]),
							previousOrders: [],
							activeOrders: [])
			
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
