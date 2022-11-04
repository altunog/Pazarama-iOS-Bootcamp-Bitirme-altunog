//
//  SignUpViewController.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 4.11.2022.
//

import UIKit

class SignUpViewController: UIViewController {
	
	private lazy var signUpView: SignUpView = {
		let view = SignUpView()
		view.interface = self
		return view
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		view.backgroundColor = .systemPink
        view = signUpView
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
