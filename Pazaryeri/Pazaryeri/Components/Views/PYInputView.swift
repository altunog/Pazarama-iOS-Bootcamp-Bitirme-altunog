//
//  PYInputView.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 4.11.2022.
//

import UIKit

class PYInputView: UIView {

	// MARK: Properties Getters and Setters
	var title: String? {
		didSet {
			titleLabel.text = title
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
	private lazy var titleLabel: PYBodyLabel = {
		let label = PYBodyLabel(textAlignment: .left, fontSize: 11)
		label.textColor = .gray
		return label
	}()
	
	private lazy var inputField: PYTextField = {
		let textField = PYTextField(placeholder: "", isSecureTextEntry: false)
		
		return textField
	}()
	
	// MARK: Init
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: Methods
	
	

}
