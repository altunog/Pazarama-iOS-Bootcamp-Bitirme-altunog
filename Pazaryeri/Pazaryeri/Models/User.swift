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
	var cart: Cart
	var previousOrders: [Cart]
	var activeOrders: [Cart]
}

struct Cart: Codable {
	var products: [Product: Int]
}

extension Cart {
	
	var totalCost: Double {
		var cost: Double = .zero
		for (product, count) in products {
			guard let price = product.price else { continue }
			cost += price * Double(count)
		}
		return cost
	}
}
