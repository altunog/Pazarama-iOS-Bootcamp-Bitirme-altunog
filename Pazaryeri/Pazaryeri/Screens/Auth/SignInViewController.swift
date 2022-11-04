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
		return view
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		view.backgroundColor = .systemPink
		view = signInView
    }

}
