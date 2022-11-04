//
//  PYInputView.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 4.11.2022.
//

import UIKit

class PYInputView: UIView {
	
	// MARK: UI Elements
	let inputLabel = PYBodyLabel(textAlignment: .left, fontSize: 14)
	let inputField = PYTextField(placeholder: "", isSecureTextEntry: false)
	
	// MARK: Init
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configureInputLabel()
		configureInputField()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: Methods
	private func configureInputLabel() {
		addSubview(inputLabel)
		inputLabel.textColor = .darkGray
		
		NSLayoutConstraint.activate([
			inputLabel.topAnchor.constraint(equalTo: topAnchor),
			inputLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
			inputLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
		])
	}
	
	private func configureInputField() {
		addSubview(inputField)
		NSLayoutConstraint.activate([
			inputField.topAnchor.constraint(equalTo: inputLabel.bottomAnchor, constant: 2),
			inputField.leadingAnchor.constraint(equalTo: leadingAnchor),
			inputField.trailingAnchor.constraint(equalTo: trailingAnchor),
			inputField.heightAnchor.constraint(equalToConstant: 52)
		])
	}
	

}
