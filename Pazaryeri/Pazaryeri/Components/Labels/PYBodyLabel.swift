//
//  PYBodyLabel.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 29.10.2022.
//

import UIKit

class PYBodyLabel: UILabel {

	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
		self.init(frame: .zero)
		self.textAlignment = textAlignment
		self.font = .systemFont(ofSize: fontSize, weight: .regular)
		configure()
	}
	
	private func configure() {
		translatesAutoresizingMaskIntoConstraints = false
		
		textColor = .black
		adjustsFontSizeToFitWidth = true
		minimumScaleFactor = 0.9
		numberOfLines = 0
		lineBreakMode = .byWordWrapping
	}
	
}
