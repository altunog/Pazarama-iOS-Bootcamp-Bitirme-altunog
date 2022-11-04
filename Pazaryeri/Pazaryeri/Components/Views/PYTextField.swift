//
//  PYTextField.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 4.11.2022.
//

import UIKit

class PYTextField: UITextField {

	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	convenience init(placeholder: String, isSecureTextEntry: Bool) {
		self.init(frame: .zero)
		self.placeholder 		= placeholder
		self.isSecureTextEntry 	= isSecureTextEntry
		configure()
	}
	
	private func configure() {
		translatesAutoresizingMaskIntoConstraints = false
		
		layer.cornerRadius 			= 3
		layer.borderWidth 			= 1
		layer.borderColor 			= UIColor.gray.cgColor
		
		textColor 					= .black
		tintColor 					= .black
		textAlignment 				= .left
		font 						= .preferredFont(forTextStyle: .title3)
		adjustsFontSizeToFitWidth	= true
		minimumFontSize 			= 16
		
		backgroundColor 			= .white
		autocapitalizationType		= .none
		autocorrectionType 			= .no
		keyboardType				= .default
		returnKeyType 				= .continue
		clearButtonMode 			= .whileEditing
	}
	let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)

	override open func textRect(forBounds bounds: CGRect) -> CGRect {
		return bounds.inset(by: padding)
	}
	
	override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
		return bounds.inset(by: padding)
	}
	
	override open func editingRect(forBounds bounds: CGRect) -> CGRect {
		return bounds.inset(by: padding)
	}

}
