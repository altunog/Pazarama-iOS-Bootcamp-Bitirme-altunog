//
//  SignUpViewController.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 4.11.2022.
//

import UIKit

class SignUpViewController: UIViewController {

	private let signUpView = SignUpView()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
        configureViewController()
    }
	
	private func configureViewController() {
		view = signUpView
		signUpView.interface = self
	}
}

extension SignUpViewController: SignUpViewInterface {
	func signUpView(_ view: SignUpView, didTapSubmitButton button: PYButton) {
		print("signed up")
		// TODO: implement firebase signUp()
	}
	
	func signUpView(_ view: SignUpView, didTapCancelButton button: UIButton) {
		print("canceled")
		dismiss(animated: true)
	}
	
	
}
