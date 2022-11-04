//
//  SignUpView.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 4.11.2022.
//

import UIKit

protocol SignInViewInterface: AnyObject {
	func signInView(_ view: SignInView, didTapContinueButton button: PYButton)
	func signInView(_ view: SignInView, didTapGoSignUpButton button: UIButton)
}

class SignInView: UIView {
	
	weak var interface: SignInViewInterface?
	
	// MARK: Properties
	private let padding: CGFloat = 20
	private let spacing: CGFloat = 8
	
	// MARK: UI Elements
	private lazy var titleLabel: UILabel = {
		let label 		= UILabel()
		label.text 		= "Sign In"
		label.font 		= .systemFont(ofSize: 48, weight: .light)
		label.textColor = .black
		return label
	}()
	
	private lazy var emailInputView: PYInputView = {
		let inputView 							=	 PYInputView()
		inputView.inputLabel.text 				= "Email"
		inputView.inputField.placeholderText 	= "enter your email address"
		inputView.inputField.keyboardType 		= .emailAddress
		return inputView
	}()
	
	private lazy var passwordInputView: PYInputView = {
		let inputView 							= PYInputView()
		inputView.inputLabel.text 				= "Password"
		inputView.inputField.placeholderText 	= "enter your password"
		inputView.inputField.isSecureTextEntry 	= true
		return inputView
	}()
	
	private lazy var continueButton: PYButton = {
		let button = PYButton(kind: .filled, color: Colors.primary, title: "Continue")
		button.addTarget(self, action: #selector(continueButtonTapped(_:)), for: .touchUpInside)
		button.layer.cornerRadius 	= 3
		button.titleLabel?.font 	= .boldSystemFont(ofSize: 18)
		return button
	}()
	
	private lazy var bottomLabel: UILabel = {
		let label 		= UILabel()
		label.text 		= "Don't have an account?"
		label.font 		= .systemFont(ofSize: 17, weight: .regular)
		label.textColor = .black
		return label
	}()
	
	private lazy var goSignUpButton: UIButton = {
		let button 				= UIButton(type: .system)
		button.titleLabel?.font = .boldSystemFont(ofSize: 17)
		button.setTitle("Sign up!", for: .normal)
		button.setTitleColor(Colors.primary, for: .normal)
		button.addTarget(self, action: #selector(goSignUpButtonTapped), for: .touchUpInside)
		return button
	}()
	
	private lazy var bottomStackView: UIStackView = {
		let stackView = UIStackView(arrangedSubviews: [bottomLabel,
													   goSignUpButton])
		return stackView
	}()
	
	// MARK: Init
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		backgroundColor = .white
		configureTitleLabel()
		configurePasswordInputView()
		configureEmailInputView()
		configureContinueButton()
		configureBottomStackView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: Configurations
	private func configureTitleLabel() {
		addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,	constant: 3*padding),
			titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
		])
	}
	
	private func configurePasswordInputView() {
		addSubview(passwordInputView)
		passwordInputView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			passwordInputView.centerYAnchor.constraint(equalTo: centerYAnchor),
			passwordInputView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: padding),
			passwordInputView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -padding),
			passwordInputView.heightAnchor.constraint(equalToConstant: 68)
		])
	}
	
	private func configureEmailInputView() {
		addSubview(emailInputView)
		emailInputView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			emailInputView.bottomAnchor.constraint(equalTo: passwordInputView.topAnchor,
												   constant: -2*spacing),
			emailInputView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: padding),
			emailInputView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -padding),
			emailInputView.heightAnchor.constraint(equalToConstant: 68)
		])
	}
	
	private func configureContinueButton() {
		addSubview(continueButton)
		continueButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			continueButton.topAnchor.constraint(equalTo: passwordInputView.bottomAnchor, constant: 2*spacing),
			continueButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: padding),
			continueButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -padding),
			continueButton.heightAnchor.constraint(equalToConstant: 52)
		])
	}
	
	private func configureBottomStackView() {
		addSubview(bottomStackView)
		bottomStackView.axis 			= .horizontal
		bottomStackView.spacing			= spacing
		bottomStackView.alignment 		= .fill
		bottomStackView.distribution 	= .fill
		
		bottomStackView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			bottomStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
			bottomStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -padding)
		])
	}
	
	//MARK: Actions
	@objc private func continueButtonTapped(_ button: PYButton) {
		interface?.signInView(self, didTapContinueButton: button)
	}

	@objc private func goSignUpButtonTapped(_ button: UIButton) {
		interface?.signInView(self, didTapGoSignUpButton: button)
	}
}
