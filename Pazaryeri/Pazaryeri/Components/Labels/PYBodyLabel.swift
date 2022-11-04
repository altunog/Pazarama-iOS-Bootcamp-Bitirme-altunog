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

	
	override func drawText(in rect: CGRect) {
		let insets = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2)
		super.drawText(in: rect.inset(by: insets))
	}
	
	override var intrinsicContentSize: CGSize {
		let size = super.intrinsicContentSize
		return CGSize(width: size.width + 2 + 2,
					  height: size.height + 0 + 0)
	}
}
