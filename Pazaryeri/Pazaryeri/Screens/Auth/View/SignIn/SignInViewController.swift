//
//  SignInViewController.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 3.11.2022.
//

import UIKit

final class SignInViewController: UIViewController {
	
	// MARK: Properties
	private let viewModel	= AuthViewModel()
	private let signInView	= SignInView()
	
	// MARK: Gettable Properties
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
		navigationItem.backButtonTitle = "Sign in"
		view = signInView
		signInView.interface	= self
		viewModel.delegate		= self
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
		viewModel.signIn(email: email, password: password)
	}
	
	func signInView(_ view: SignInView, didTapGoSignUpButton button: UIButton) {
		let signUpVC = SignUpViewController()
		navigationController?.pushViewController(signUpVC, animated: true)
	}
}

extension SignInViewController: AuthViewModelDelegate {
	func didOccurError(_ error: Error) {
		print(error.localizedDescription)
	}
	
	func didSignInSuccessful() {
		let tabBar = PYMainTabBarController()
		tabBar.modalPresentationStyle = .fullScreen
		present(tabBar, animated: true)
	}
}
