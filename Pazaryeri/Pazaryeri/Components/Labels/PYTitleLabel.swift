//
//  PYTitleLabel.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 28.10.2022.
//

import UIKit

class PYTitleLabel: UILabel {
	
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
		self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
		configure()
	}
	
	private func configure() {
		textColor = .black
		adjustsFontSizeToFitWidth = true
		minimumScaleFactor = 0.9
		lineBreakMode = .byWordWrapping
		translatesAutoresizingMaskIntoConstraints = false
	}
}
