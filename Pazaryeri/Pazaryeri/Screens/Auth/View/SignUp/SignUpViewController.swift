//
//  SignUpViewController.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 4.11.2022.
//

import UIKit

final class SignUpViewController: UIViewController {

	// MARK: Properties
	private let viewModel	= AuthViewModel()
	private let signUpView	= SignUpView()
	
	// MARK: Gettable Properties
	var username: String {
		signUpView.usernameInputView.inputField.text ?? ""
	}
	
	var email: String {
		signUpView.emailInputView.inputField.text ?? ""
	}
	
	var password: String {
		signUpView.passwordInputView.inputField.text ?? ""
	}
	
	var confirmPassword: String {
		signUpView.confirmInputView.inputField.text ?? ""
	}
	
	// MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
	
	// MARK: Configurations
	private func configureViewController() {
		view = signUpView
		signUpView.interface	= self
		viewModel.delegate		= self
	}
}

// MARK: SignUpViewInterface
extension SignUpViewController: SignUpViewInterface {
	func signUpView(_ view: SignUpView, inputFieldDidEditingChange inputField: PYInputField) {
		let usernameFilled 	= username != "" && !username.contains(" ")
		let emailFilled		= email != "" && !email.contains(" ")
		let passwordFilled	= password != "" && !password.contains(" ")
		let confirmFilled	= confirmPassword != "" && !confirmPassword.contains(" ")
		let formFilled 		= usernameFilled && emailFilled && passwordFilled && confirmFilled
		signUpView.setSubmitButton(enabled: formFilled)
	}
	
	func signUpView(_ view: SignUpView, didTapSubmitButton button: PYButton) {
		viewModel.signUp(username: username, email: email, password: password)
	}
	
	func signUpView(_ view: SignUpView, didTapCancelButton button: UIButton) {
		print("canceled")
		dismiss(animated: true)
	}
}

// MARK: AuthViewModelDelegate
extension SignUpViewController: AuthViewModelDelegate {
	func didOccurError(_ error: Error) {
		print(error.localizedDescription)
	}
	
	func didSignUpSuccessful() {
		let tabBar = PYMainTabBarController()
		tabBar.modalPresentationStyle = .fullScreen
		present(tabBar, animated: true)
	}
	
}
