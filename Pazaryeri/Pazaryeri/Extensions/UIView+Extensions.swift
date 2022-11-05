//
//  UIView+Extensions.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 30.10.2022.
//

import UIKit

extension UIView {
	
	func pinToEdges(of superview: UIView) {
		translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			topAnchor.constraint(equalTo: superview.topAnchor),
			leadingAnchor.constraint(equalTo: superview.leadingAnchor),
			trailingAnchor.constraint(equalTo: superview.trailingAnchor),
			bottomAnchor.constraint(equalTo: superview.bottomAnchor)
		])
	}
	
	func pinToTop(of superview: UIView, withHeight height: CGFloat) {
		translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			topAnchor.constraint(equalTo: superview.topAnchor),
			leadingAnchor.constraint(equalTo: superview.leadingAnchor),
			trailingAnchor.constraint(equalTo: superview.trailingAnchor),
			heightAnchor.constraint(equalToConstant: height)
		])
	}
	
	func addVerticalGradient(topColor: UIColor!, bottomColor: UIColor!) {
		let gradient = CAGradientLayer()
		gradient.frame 		= bounds
		gradient.colors 	= [topColor.cgColor,
							   bottomColor.cgColor]
		gradient.locations 	= [0.0, 1.0]
		gradient.startPoint = CGPoint(x: 0, y: 0)
		gradient.endPoint 	= CGPoint(x: 0, y: 1)
		layer.insertSublayer(gradient, at: 0)
	}
}
