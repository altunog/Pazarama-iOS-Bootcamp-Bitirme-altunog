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
}

final class ProductDetailViewModel {
	
	weak var delegate: ProductDetailViewModelDelegate?
	
	private let db = Firestore.firestore()
	
	private(set) var cartCost = Double()
	
	func fetchCartCost() {
		let currentUser = Auth.auth().currentUser
		guard let currentUser else { return }
		
		let userRef = db.collection("users").document(currentUser.uid)
		userRef.getDocument(as: User.self) { result in
			switch result {
			case .failure(let error):
				self.delegate?.errorDidOccur(error)
			case .success(let user):
				self.cartCost = user.totalCost
				self.delegate?.didFetchCartCost()
			}
		}
		
//		userRef.getDocument { document, error in
//			if let error {
//				self.delegate?.errorDidOccur(error)
//				return
//			}
//			if let document, document.exists,
//			   let data = document.data() {
//				let cart = data as? User
//				self.cartCost =
//				print(cart!)
//			} else {
//				print("document does not exist")
//			}
//		}
		
	}
	
}
