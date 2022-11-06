//
//  User.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 1.11.2022.
//

import Foundation
import PazaryeriAPI

struct User: Codable {
	var id: String
	var username: String
	var email: String
	var cart: [Cart]
	var previousOrders: [[Cart]]
	var activeOrders: [[Cart]]
}

struct Cart: Codable {
	var productId: Int
	var quantity: Int
}

extension User {
	
//	var totalCost: Double {
//		var cost: Double = .zero
//		for product in cart {
//			let price = product.product._price
//			cost += price * Double(product.quantity)
//		}
//		return cost
//	}
}
