//
//  SignInViewController.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 3.11.2022.
//

import UIKit

class SignInViewController: UIViewController {
	
	private let signInView = SignInView()
	
	var email: String {
		signInView.emailInputView.inputField.text ?? ""
	}
	
	var password: String {
		signInView.passwordInputView.inputField.text ?? ""
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		configureViewController()
    }
	
	private func configureViewController() {
		view = signInView
		signInView.interface = self
	}

}

extension SignInViewController: SignInViewInterface {
	func signInView(_ view: SignInView, inputFieldDidEditingChange inputField: PYInputField) {
		let emailFilled		= email != "" && !email.contains(" ")
		let passwordFilled	= password != "" && !password.contains(" ")
		let formFilled		= emailFilled && passwordFilled
		signInView.setContinueButton(enabled: formFilled)
	}
	
	func signInView(_ view: SignInView, didTapContinueButton button: PYButton) {
		print("Burada")
	}
	
	func signInView(_ view: SignInView, didTapGoSignUpButton button: UIButton) {
		let signUpVC = SignUpViewController()
		present(signUpVC, animated: true)
	}
}
