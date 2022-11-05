//
//  SignUpView.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 4.11.2022.
//

import UIKit

protocol SignUpViewInterface: AnyObject {
	func signUpView(_ view: SignUpView, didTapSubmitButton button: PYButton)
	func signUpView(_ view: SignUpView, didTapCancelButton button: UIButton)
	func signUpView(_ view: SignUpView, inputFieldDidEditingChange inputField: PYInputField)
}

final class SignUpView: UIView {
	
	weak var interface: SignUpViewInterface?

	// MARK: Properties
	private let height: CGFloat		= 68
	private let padding: CGFloat	= 20
	private let spacing: CGFloat	= 8
	
	// MARK: - UI Elements
	private let cancelButton 		= UIButton(type: .system)
	private let titleLabel 			= PYTitleLabel(textAlignment: .center, fontSize: 36)

	let usernameInputView 		= PYInputView()
	let emailInputView 			= PYInputView()
	let passwordInputView 		= PYInputView()
	let confirmInputView 		= PYInputView()
	
	private let submitButton	= PYButton(kind: .tinted, color: Colors.primary, title: "Submit")
	
	// MARK: Init
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		backgroundColor = .white
		configureCancelButton()
		configureTitleLabel()
		configureEmailInputView()
		configureUsernameInputView()
		configurePasswordIntputView()
		configureConfirmInputView()
		configureSubmitButton()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: Configurations
	private func configureCancelButton() {
		addSubview(cancelButton)
		cancelButton.setTitle("Cancel", for: .normal)
		cancelButton.setTitleColor(Colors.primary, for: .normal)
		cancelButton.titleLabel?.font = .systemFont(ofSize: 17)
		cancelButton.addTarget(self, action: #selector(cancelButtonTapped(_:)), for: .touchUpInside)
		
		cancelButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			cancelButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: padding),
			cancelButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: padding)
		])
	}
	
	private func configureTitleLabel() {
		addSubview(titleLabel)
		titleLabel.text = "Sign Up"
		
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,	constant: 4*padding),
			titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
		])
	}
	
	private func configureUsernameInputView() {
		addSubview(usernameInputView)
		usernameInputView.set(text: "Username", placeholder: "choose a username")

		usernameInputView.inputField.addTarget(self, action: #selector(inputFieldChanged(_:)), for: .editingChanged)
		
		NSLayoutConstraint.activate([
			usernameInputView.bottomAnchor.constraint(equalTo: emailInputView.topAnchor, constant: -spacing),
			usernameInputView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: padding),
			usernameInputView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -padding),
			usernameInputView.heightAnchor.constraint(equalToConstant: height)
		])
	}
	
	private func configureEmailInputView() {
		addSubview(emailInputView)
		emailInputView.set(text: "Email", placeholder: "enter your email address", keyboardType: .emailAddress)
		
		emailInputView.inputField.addTarget(self, action: #selector(inputFieldChanged(_:)), for: .editingChanged)
		
		NSLayoutConstraint.activate([
			emailInputView.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -spacing/2),
			emailInputView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: padding),
			emailInputView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -padding),
			emailInputView.heightAnchor.constraint(equalToConstant: height)
		])
	}
	
	private func configurePasswordIntputView() {
		addSubview(passwordInputView)
		passwordInputView.set(text: "Password", placeholder: "choose a password", isSecureEntry: true)
		
		passwordInputView.inputField.addTarget(self, action: #selector(inputFieldChanged(_:)), for: .editingChanged)
		
		NSLayoutConstraint.activate([
			passwordInputView.topAnchor.constraint(equalTo: centerYAnchor, constant: spacing/2),
			passwordInputView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: padding),
			passwordInputView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -padding),
			passwordInputView.heightAnchor.constraint(equalToConstant: height)
		])
	}
	
	private func configureConfirmInputView() {
		addSubview(confirmInputView)
		confirmInputView.set(text: "Confirm Password", placeholder: "re-enter your password", isSecureEntry: true)
		
		confirmInputView.inputField.addTarget(self, action: #selector(inputFieldChanged(_:)), for: .editingChanged)
		
		NSLayoutConstraint.activate([
			confirmInputView.topAnchor.constraint(equalTo: passwordInputView.bottomAnchor, constant: spacing),
			confirmInputView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: padding),
			confirmInputView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -padding),
			confirmInputView.heightAnchor.constraint(equalToConstant: height)
		])
	}
	
	private func configureSubmitButton() {
		addSubview(submitButton)
		submitButton.set(cornerRadius: 3, font: .boldSystemFont(ofSize: 18))
		submitButton.switchToggle(enabled: false)
		
		submitButton.addTarget(self, action: #selector(submitButtonTapped(_:)), for: .touchUpInside)
		
		submitButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			submitButton.topAnchor.constraint(equalTo: confirmInputView.bottomAnchor, constant: 2*spacing),
			submitButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: padding),
			submitButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -padding),
			submitButton.heightAnchor.constraint(equalToConstant: 52)
		])
	}
	
	// MARK: Actions
	@objc private func submitButtonTapped(_ button: PYButton) {
		interface?.signUpView(self, didTapSubmitButton: button)
	}
	
	@objc private func cancelButtonTapped(_ button: UIButton) {
		interface?.signUpView(self, didTapCancelButton: button)
	}
	
	@objc private func inputFieldChanged(_ inputField: PYInputField) {
		interface?.signUpView(self, inputFieldDidEditingChange: inputField)
	}
	
	// MARK: Methods
	func setSubmitButton(enabled: Bool) {
		submitButton.switchToggle(enabled: enabled)
	}
}
