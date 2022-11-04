//
//  PYInputView.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 4.11.2022.
//

import UIKit

class PYInputView: UIView {

	// MARK: Properties Getters and Setters
	var input: String? {
		didSet {
			inputLabel.text = input
		}
	}
	
	var placeholder: String? {
		didSet {
			inputField.placeholder = placeholder
		}
	}
	
	var isSecureText: Bool = false {
		didSet {
			inputField.isSecureTextEntry = isSecureText
		}
	}
	
	// MARK: UI Elements
	private(set) lazy var inputLabel: PYBodyLabel = {
		let label = PYBodyLabel(textAlignment: .left, fontSize: 11)
		label.textColor = .gray
		return label
	}()
	
	private(set) lazy var inputField: PYTextField = {
		let textField = PYTextField(placeholder: "", isSecureTextEntry: false)
		
		return textField
	}()
	
	// MARK: Init
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupInputLabel()
		setupInputField()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: Methods
	private func setupInputLabel() {
		addSubview(inputLabel)
		NSLayoutConstraint.activate([
			inputLabel.topAnchor.constraint(equalTo: topAnchor),
			inputLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
			inputLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
		])
	}
	
	private func setupInputField() {
		addSubview(inputField)
		NSLayoutConstraint.activate([
			inputField.topAnchor.constraint(equalTo: inputLabel.bottomAnchor),
			inputField.leadingAnchor.constraint(equalTo: leadingAnchor),
			inputField.trailingAnchor.constraint(equalTo: trailingAnchor)
		])
	}
	

}
