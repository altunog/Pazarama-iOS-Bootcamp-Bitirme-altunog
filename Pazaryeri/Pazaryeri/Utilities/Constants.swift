//
//  Constants.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 27.10.2022.
//

import UIKit

enum Symbols {
	static let house 		= UIImage(named: "house")
	static let houseFill 	= UIImage(named: "house.fill")
	static let product 		= UIImage(named: "shippingbox")
	static let productFill 	= UIImage(named: "shippingbox.fill")
	static let search 		= UIImage(named: "magnifyingglass")
	static let searchFill 	= UIImage(named: "magnifyingglass.fill")
	static let person 		= UIImage(named: "person")
	static let personFill 	= UIImage(named: "person.fill")
}

enum Colors {
	static let primary 		= UIColor(named: "PrimaryColor")
	static let secondary 	= UIColor(named: "SecondaryColor")
	static let tertiary 	= UIColor(named: "TertiaryColor")
}

enum Images {
	static let placeholder 	= UIImage(named: "product-placeholder")
	static let cart			= UIImage(named: "cart")
}

enum ButtonKind {
	case filled
	case tinted
}
