//
//  PYProductImageView.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 29.10.2022.
//

import UIKit

class PYProductImageView: UIImageView {

	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configure() {
		layer.cornerRadius = 8
		layer.borderColor = UIColor.lightGray.cgColor
		layer.borderWidth = 0.5
		contentMode = .scaleToFill
		clipsToBounds = true
		image = Images.placeholder
		backgroundColor = .orange
		translatesAutoresizingMaskIntoConstraints = false
	}
}
