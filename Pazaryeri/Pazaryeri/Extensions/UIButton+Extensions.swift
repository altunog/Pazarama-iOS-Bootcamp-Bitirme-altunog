//
//  UIButton+Extensions.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 1.11.2022.
//

import UIKit

extension UIButton {
	
	func updateInsets(considering price: Double) {
		if price > .zero {
			titleEdgeInsets = UIEdgeInsets(top: 5, left: 5,
										   bottom: 5, right: 5)
			imageEdgeInsets.right = 20
		} else {
			titleEdgeInsets = UIEdgeInsets(top: 0, left: 0,
										   bottom: 0, right: 0)
			imageEdgeInsets.right = 0
		}
	}
	
	func collapse(to width: CGFloat = 25) -> NSLayoutConstraint? {
		updateInsets(considering: .zero)
		return widthAnchor.constraint(equalToConstant: width)
	}
	
	func expand(considering price: Double) -> NSLayoutConstraint? {
		updateInsets(considering: price)
		
		let width: CGFloat

		switch price {
		case .zero:
			width = 25
		case ..<10:
			width = 80
		case ..<100:
			width = 87.5
		case ..<1000:
			width = 95
		default:
			width = 110
		}
		
		return widthAnchor.constraint(equalToConstant: width)
	}
}
