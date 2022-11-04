//
//  SignUpView.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 4.11.2022.
//

import UIKit

class SignInView: UIView {
	
	// MARK: Properties
	private let padding: CGFloat = 20

	// MARK: UI Elements
	private lazy var titleLabel: UILabel = {
		let label 		= UILabel()
		label.text 		= "Sign In"
		label.font 		= .systemFont(ofSize: 48, weight: .light)
		label.textColor = .black
		return label
	}()

	private lazy var emailInputView: PYInputView = {
		let inputView 						= PYInputView()
		inputView.inputLabel.text 			= "Email"
		inputView.inputField.placeholder 	= "Enter your email address"
		inputView.inputField.keyboardType 	= .emailAddress
		return inputView
	}()
		
	private lazy var passwordInputView: PYInputView = {
		let inputView 							= PYInputView()
		inputView.inputLabel.text 				= "Password"
		inputView.inputField.placeholder 		= "Enter your password"
		inputView.inputField.isSecureTextEntry 	= true
		return inputView
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
		
		button.setTitle("Sign Up", for: .normal)
		button.setTitleColor(Colors.primary, for: .normal)
		//		button.backgroundColor = .none
		//		button.addTarget(self,
		//						 action: #selector(didTapCancelButton(_:)),
		//						 for: .touchUpInside)
		return button
	}()
	
	private lazy var signInStackView: UIStackView = {
		let stackView = UIStackView(arrangedSubviews: [emailInputView,
													   passwordInputView])
		return stackView
	}()
	
	private lazy var bottomStackView: UIStackView = {
		let stackView = UIStackView(arrangedSubviews: [bottomLabel,
													   goSignUpButton])
		return stackView
	}()
	
	// MARK: Init
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configureTitleLabel()
		configureSignInStackView()
		configureBottomStackView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: Configurations
	private func configureTitleLabel() {
		addSubview(titleLabel)
		
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,	constant: 4*padding),
			titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
		])
	}
	
//	private func configureEmailInputView() {
//		addSubview(emailInputView)
//		NSLayoutConstraint.activate([
//
//		])
//	}
//
//	private func configurePasswordInputView() {
//		addSubview(passwordInputView)
//		NSLayoutConstraint.activate([
//
//		])
//	}
//
	private func configureSignInStackView() {
		addSubview(signInStackView)
		signInStackView.axis 			= .vertical
		signInStackView.spacing 		= 3
		signInStackView.alignment 		= .fill
		signInStackView.distribution	= .fill
		
		NSLayoutConstraint.activate([
			signInStackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100),
			signInStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
			signInStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
		])
	}
	
	private func configureBottomStackView() {
		addSubview(bottomStackView)
		bottomStackView.axis 			= .horizontal
		bottomStackView.spacing			= 7
		bottomStackView.alignment 		= .fill
		bottomStackView.distribution 	= .fill
		
		NSLayoutConstraint.activate([
			bottomStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
			bottomStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -3*padding)
		])
	}
}
