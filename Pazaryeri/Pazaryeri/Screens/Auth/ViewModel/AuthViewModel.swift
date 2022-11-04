//
//  AuthViewModel.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 3.11.2022.
//

import Foundation

protocol AuthViewModelDelegate: AnyObject {
	func didOccurError(_ error: Error)
	func didSignUpSuccessful()
	func didSignInSuccessful()
}

final class AuthViewModel {
	weak var delegate: AuthViewModelDelegate?
	
	
}
