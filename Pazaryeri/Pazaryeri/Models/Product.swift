//
//  Product.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 1.11.2022.
//

import Foundation

struct Product: Codable {
	
	var id: Int?
	var title: String?
	var price: Double?
	var description: String?
	var category: String?
	var image: String?
	var rating: Rating?
}

struct Rating: Codable {
	
	var rate: Double?
	var count: Int?
}
