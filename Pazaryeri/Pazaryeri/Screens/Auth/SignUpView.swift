//
//  SignUpView.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 4.11.2022.
//

import UIKit

class SignUpView: UIView {

	// MARK: Properties
	private let height: CGFloat		= 68
	private let padding: CGFloat	= 20
	private let spacing: CGFloat	= 8
	
	// MARK: - UI Elements
	private lazy var cancelButton: UIButton = {
		let button 				= UIButton(type: .system)
		button.titleLabel?.font = .systemFont(ofSize: 17)
		button.setTitle("Cancel", for: .normal)
		button.setTitleColor(Colors.primary, for: .normal)
//		button.addTarget(self,
//						 action: #selector(didTapCancelButton(_:)),
//						 for: .touchUpInside)
		return button
	}()

	private lazy var titleLabel: UILabel = {
		let label 		= UILabel()
		label.text 		= "Sign Up"
		label.font 		= .systemFont(ofSize: 48, weight: .light)
		label.textColor = .black
		return label
	}()
	
	private lazy var usernameInputView: PYInputView = {
		let inputView = PYInputView()
		inputView.inputLabel.text 				= "Username"
		inputView.inputField.placeholderText 	= "choose a username"
		return inputView
	}()
	
	private lazy var emailInputView: PYInputView = {
		let inputView 							= PYInputView()
		inputView.inputLabel.text 				= "Email"
		inputView.inputField.placeholderText	= "enter your email address"
		inputView.inputField.keyboardType 		= .emailAddress
		return inputView
	}()
	
	private lazy var passwordInputView: PYInputView = {
		let inputView 							= PYInputView()
		inputView.inputLabel.text 				= "Password"
		inputView.inputField.placeholderText 	= "choose a password"
		inputView.inputField.isSecureTextEntry 	= true
		return inputView
	}()
	
	private lazy var confirmInputView: PYInputView = {
		let inputView 							= PYInputView()
		inputView.inputLabel.text 				= "Confirm Password"
		inputView.inputField.placeholderText 	= "confirm your password"
		inputView.inputField.isSecureTextEntry	= true
		return inputView
	}()
	
	private lazy var continueButton: PYButton = {
		let button = PYButton(kind: .filled, color: Colors.tertiary, title: "Continue")
		button.layer.cornerRadius 	= 3
		button.titleLabel?.font 	= .boldSystemFont(ofSize: 18)
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		backgroundColor = .white
		configureCancelButton()
		configureTitleLabel()
		configureEmailInputView()
		configureUsernameInputView()
		configurePasswordIntputView()
		configureConfirmInputView()
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: Configurations
	private func configureCancelButton() {
		addSubview(cancelButton)
		cancelButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			cancelButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: padding),
			cancelButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: padding)
		])
	}
	
	private func configureTitleLabel() {
		addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,	constant: 4*padding),
			titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
		])
	}
	
	private func configureUsernameInputView() {
		addSubview(usernameInputView)
		NSLayoutConstraint.activate([
			usernameInputView.bottomAnchor.constraint(equalTo: emailInputView.topAnchor, constant: -spacing),
			usernameInputView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: padding),
			usernameInputView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -padding),
			usernameInputView.heightAnchor.constraint(equalToConstant: height)
		])
	}
	
	private func configureEmailInputView() {
		addSubview(emailInputView)
		NSLayoutConstraint.activate([
			emailInputView.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -spacing/2),
			emailInputView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: padding),
			emailInputView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -padding),
			emailInputView.heightAnchor.constraint(equalToConstant: height)
		])
	}
	
	private func configurePasswordIntputView() {
		addSubview(passwordInputView)
		NSLayoutConstraint.activate([
			passwordInputView.topAnchor.constraint(equalTo: centerYAnchor, constant: spacing/2),
			passwordInputView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: padding),
			passwordInputView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -padding),
			passwordInputView.heightAnchor.constraint(equalToConstant: height)
		])
	}
	
	private func configureConfirmInputView() {
		addSubview(confirmInputView)
		NSLayoutConstraint.activate([
			confirmInputView.topAnchor.constraint(equalTo: passwordInputView.bottomAnchor, constant: spacing),
			confirmInputView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: padding),
			confirmInputView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -padding),
			confirmInputView.heightAnchor.constraint(equalToConstant: height)
		])
	}
	
}
