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
	func signInView(_ view: SignInView, inputFieldDidEditingChange inputField: PYInputField)
}

final class SignInView: UIView {
	
	weak var interface: SignInViewInterface?
	
	// MARK: Properties
	private let padding: CGFloat = 20
	private let spacing: CGFloat = 8
	
	// MARK: UI Elements
	private let titleLabel 	= PYTitleLabel(textAlignment: .center, fontSize: 36)
	
	let emailInputView 			= PYInputView()
	let passwordInputView 		= PYInputView()
	private let continueButton 	= PYButton(kind: .filled, color: Colors.primary, title: "Continue")
	
	private let bottomLabel		= UILabel()
	private let goSignUpButton 	= UIButton(type: .system)
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
		configureBottomLabel()
		configureGoSignUpButton()
		configureBottomStackView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: Configurations
	private func configureTitleLabel() {
		addSubview(titleLabel)
		titleLabel.text = "Sign In"
		
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,	constant: 3*padding),
			titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
		])
	}
	
	private func configureEmailInputView() {
		addSubview(emailInputView)
		emailInputView.set(text: "EMAIL", placeholder: "enter your email address", keyboardType: .emailAddress)

		emailInputView.inputField.addTarget(self, action: #selector(inputFieldChanged(_:)), for: .editingChanged)
		
		emailInputView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			emailInputView.bottomAnchor.constraint(equalTo: passwordInputView.topAnchor, constant: -2*spacing),
			emailInputView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: padding),
			emailInputView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -padding),
			emailInputView.heightAnchor.constraint(equalToConstant: 68)
		])
	}
	
	private func configurePasswordInputView() {
		addSubview(passwordInputView)
		passwordInputView.set(text: "PASSWORD", placeholder: "enter your password", isSecureEntry: true)
		
		passwordInputView.inputField.addTarget(self, action: #selector(inputFieldChanged(_:)), for: .editingChanged)
		
		passwordInputView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			passwordInputView.centerYAnchor.constraint(equalTo: centerYAnchor),
			passwordInputView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: padding),
			passwordInputView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -padding),
			passwordInputView.heightAnchor.constraint(equalToConstant: 68)
		])
	}
	
	private func configureContinueButton() {
		addSubview(continueButton)
		continueButton.set(cornerRadius: 3, font: .boldSystemFont(ofSize: 18))
		continueButton.switchToggle(enabled: false)
		
		continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
		
		continueButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			continueButton.topAnchor.constraint(equalTo: passwordInputView.bottomAnchor, constant: 2*spacing),
			continueButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: padding),
			continueButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -padding),
			continueButton.heightAnchor.constraint(equalToConstant: 52)
		])
	}
	
	private func configureBottomLabel() {
		bottomLabel.text = "Don't have an account?"
		bottomLabel.font = .systemFont(ofSize: 17, weight: .regular)
	}
	
	private func configureGoSignUpButton() {
		goSignUpButton.titleLabel?.font = .boldSystemFont(ofSize: 17)
		goSignUpButton.setTitle("Sign up!", for: .normal)
		goSignUpButton.setTitleColor(Colors.primary, for: .normal)
		goSignUpButton.addTarget(self, action: #selector(goSignUpButtonTapped), for: .touchUpInside)
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
	
	@objc private func inputFieldChanged(_ inputField: PYInputField) {
		interface?.signInView(self, inputFieldDidEditingChange: inputField)
	}
	
	func setContinueButton(enabled: Bool) {
		continueButton.switchToggle(enabled: enabled)
	}
}
