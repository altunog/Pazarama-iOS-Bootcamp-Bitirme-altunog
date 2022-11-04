//
//  PYInputView.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 4.11.2022.
//

import UIKit

class PYInputView: UIView {
	
	// MARK: UI Elements
	let inputLabel = PYInputLabel(textAlignment: .left, fontSize: 14)
	let inputField = PYInputField(placeholder: "", isSecureTextEntry: false)
	
	// MARK: Init
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configure()
		configureInputField()
		configureInputLabel()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: Configurations
	private func configure() {
		translatesAutoresizingMaskIntoConstraints = false
		inputField.delegate = self
	}
	
	private func configureInputLabel() {
		addSubview(inputLabel)
		inputLabel.textColor = .darkGray
		inputLabel.backgroundColor = .white
		NSLayoutConstraint.activate([
//			inputLabel.topAnchor.constraint(equalTo: topAnchor),
			inputLabel.centerYAnchor.constraint(equalTo: inputField.topAnchor),
			inputLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
//			inputLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
			
		])
	}
	
	private func configureInputField() {
		addSubview(inputField)
		NSLayoutConstraint.activate([
//			inputField.topAnchor.constraint(equalTo: inputLabel.bottomAnchor, constant: 2),
			inputField.topAnchor.constraint(equalTo: topAnchor, constant: 6),
			inputField.leadingAnchor.constraint(equalTo: leadingAnchor),
			inputField.trailingAnchor.constraint(equalTo: trailingAnchor),
			inputField.heightAnchor.constraint(equalToConstant: 52)
		])
	}
}

extension PYInputView: UITextFieldDelegate {
	func textFieldDidBeginEditing(_ textField: UITextField) {
		textField.layer.borderColor = Colors.primary?.cgColor
		inputLabel.textColor		= Colors.primary
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		textField.layer.borderColor = UIColor.lightGray.cgColor
		inputLabel.textColor		= .black
	}
}
