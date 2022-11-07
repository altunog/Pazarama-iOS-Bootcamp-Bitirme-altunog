//
//  ProfileViewController.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 7.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {

	let viewModel = ProfileViewModel()
	
	@IBOutlet weak var usernameLabel: UILabel!
	@IBOutlet weak var emailLabel: UILabel!
	@IBOutlet weak var logoutButton: UIButton!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		configureViewController()
		viewModel.fetchUser()
		configureLabels()
    }
	
	private func configureViewController() {
		viewModel.delegate = self
	}
	
	private func configureLabels() {
		usernameLabel.text 	= "Username: \(viewModel.username ?? "not available")"
		emailLabel.text		= "Email: \(viewModel.email ?? "not available")"
	}
	

	@IBAction func logoutButtonTapped(_ button: UIButton) {
		// TODO: show alert
		viewModel.signOut()
	}
}

extension ProfileViewController: ProfileViewModelDelegate {
	func errorDidOccur(_ error: Error) {
		print(error.localizedDescription)
	}
	
	func didSignOutSuccessful() {

	}
}
