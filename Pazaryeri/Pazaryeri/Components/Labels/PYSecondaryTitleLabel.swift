//
//  PYSecondaryTitleLabel.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 28.10.2022.
//

import UIKit

class PYSecondaryTitleLabel: UILabel {

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
		self.font = UIFont.systemFont(ofSize: fontSize, weight: .semibold)
		configure()
	}
	
	private func configure() {
		textColor = .darkGray
		adjustsFontSizeToFitWidth = true
		minimumScaleFactor = 0.9
		numberOfLines = 3
		lineBreakMode = .byTruncatingTail
		translatesAutoresizingMaskIntoConstraints = false
	}

}
