//
//  PYCartButton.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 30.10.2022.
//

import UIKit

class PYCartButton: UIButton {

	var title: String = "" {
		didSet {
			setTitle(title, for: .normal)
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	convenience init(color: UIColor!, image: UIImage!, title: String) {
		self.init(type: .system)
		setImage(image, for: .normal)
		setTitle(title, for: .normal)
		configure(using: color)
	}
	
	private func configure(using color: UIColor) {
		translatesAutoresizingMaskIntoConstraints = false
		
		layer.backgroundColor = color.cgColor
		layer.cornerRadius = 3
		layer.borderColor = color.cgColor
		layer.borderWidth = 1
		
		titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
		titleLabel?.adjustsFontSizeToFitWidth = true
	}
	
	

}
