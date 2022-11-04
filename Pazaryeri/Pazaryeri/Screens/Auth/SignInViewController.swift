//
//  SignInViewController.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 3.11.2022.
//

import UIKit

class SignInViewController: UIViewController {

	private lazy var signInView: SignInView = {
		let view = SignInView()
		view.delegate = self
		return view
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		view.backgroundColor = .systemPink
		view = signInView
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
