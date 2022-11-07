//
//  ProfileViewModel.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 7.11.2022.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol ProfileViewModelDelegate: AnyObject {
	func errorDidOccur(_ error: Error)
	func didSignOutSuccessful()
}

final class ProfileViewModel {
	
	weak var delegate: ProfileViewModelDelegate?
	let currentUser = Auth.auth().currentUser
	
	private(set) var username: String?
	private(set) var email: String?
	
	func fetchUser() {
		if let currentUser {
			username 	= currentUser.displayName
			email		= currentUser.email
		}
	}
	
	func signOut() {
		do {
			try Auth.auth().signOut()
			delegate?.didSignOutSuccessful()
		} catch {
			delegate?.errorDidOccur(error)
		}
	}
}
