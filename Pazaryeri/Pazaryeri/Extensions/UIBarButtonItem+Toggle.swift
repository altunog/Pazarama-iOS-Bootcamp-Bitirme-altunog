//
//  UIBarButtonItem+Toggle.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 1.11.2022.
//

import UIKit

extension UIBarButtonItem {
	
	func collapse(to width: CGFloat) -> NSLayoutConstraint? {
		return customView?.widthAnchor.constraint(equalToConstant: width)
	}
	
	func toggle(considering price: Double) -> NSLayoutConstraint? {
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
		
		return customView?.widthAnchor.constraint(equalToConstant: width)
	}
}
