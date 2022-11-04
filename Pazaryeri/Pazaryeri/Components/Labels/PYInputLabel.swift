//
//  PYInputLabel.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 4.11.2022.
//

import UIKit

class PYInputLabel: UILabel {

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
	}

	// MARK: MEMO: code from stackoverflow, adds inset to left and right edges of UILabel
	// https://stackoverflow.com/questions/27459746/adding-space-padding-to-a-uilabel
	let inset: CGFloat = 2
	
	override func drawText(in rect: CGRect) {
		let insets = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
		super.drawText(in: rect.inset(by: insets))
	}
	
	override var intrinsicContentSize: CGSize {
		let size = super.intrinsicContentSize
		return CGSize(width: size.width + inset + inset,
					  height: size.height + 0 + 0)
	}

}
