//
//  SignInViewController.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 3.11.2022.
//

import UIKit

class SignInViewController: UIViewController {
	
	private let signInView = SignInView()
	
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
	func signInView(_ view: SignInView, didTapContinueButton button: PYButton) {
		print("Burada")
	}
	
	func signInView(_ view: SignInView, didTapGoSignUpButton button: UIButton) {
		let signUpVC = SignUpViewController()
		present(signUpVC, animated: true)
	}
}
