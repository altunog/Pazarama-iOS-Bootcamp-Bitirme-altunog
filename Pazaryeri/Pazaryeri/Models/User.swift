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
	var products: [ProductCount]
}

struct ProductCount: Codable {
	var product: Product
	var quantity: Int
}

extension Cart {
	
	var totalCost: Double {
		var cost: Double = .zero
		for product in products {
			guard let price = product.product.price else { continue }
			cost += price * Double(product.quantity)
		}
		return cost
	}
	
	var totalCostV2: Double {
		products.reduce(0) { total, item in
			guard let price = item.product.price else { return 0 }
			return total + price * Double(item.quantity)
		}
	}
}
