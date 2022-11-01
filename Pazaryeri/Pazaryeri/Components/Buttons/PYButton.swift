//
//  PYButton.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 27.10.2022.
//

import UIKit

final class PYButton: UIButton {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	convenience init(kind: ButtonKind, color: UIColor!, title: String) {
		self.init(type: .system)
		setTitle(title, for: .normal)
		
		switch kind {
		case .filled:
			backgroundColor = color
			setTitleColor(.white, for: .normal)
		case .tinted:
			backgroundColor = color.withAlphaComponent(0.1)
			setTitleColor(color, for: .normal)
		}
		
		configure()
	}
	
	private func configure() {
		translatesAutoresizingMaskIntoConstraints = false
		layer.cornerRadius 	= 8
		titleLabel?.font 	= .preferredFont(forTextStyle: .callout)
	}
}
