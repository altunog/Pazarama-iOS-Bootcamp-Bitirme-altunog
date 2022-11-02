//
//  Product.swift
//  PazaryeriAPI
//
//  Created by Oğuz Kaan Altun on 2.11.2022.
//

import Foundation

public struct Product: Codable {
	let id: Int?
	let title: String?
	let price: Double?
	let description: String?
	let category: String?
	let image: String?
	let rating: Rating?
}

public struct Rating: Codable {
	let rate: Double?
	let count: Int?
}
