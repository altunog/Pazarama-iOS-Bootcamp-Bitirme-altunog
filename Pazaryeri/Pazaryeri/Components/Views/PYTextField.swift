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
		layer.borderColor 			= UIColor.darkGray.cgColor
		
		textColor 					= .black
		tintColor 					= .black
		textAlignment 				= .left
		font 						= .preferredFont(forTextStyle: .title3)
		adjustsFontSizeToFitWidth	= true
		minimumFontSize 			= 16
		
		backgroundColor 			= .lightGray
		autocorrectionType 			= .no
		returnKeyType 				= .next
		clearButtonMode 			= .whileEditing
	}

}
