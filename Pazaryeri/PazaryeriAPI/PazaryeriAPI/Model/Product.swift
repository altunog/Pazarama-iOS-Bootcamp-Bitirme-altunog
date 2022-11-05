//
//  Product.swift
//  PazaryeriAPI
//
//  Created by Oğuz Kaan Altun on 2.11.2022.
//

import Foundation

public struct Product: Codable, Hashable {
	
	public var id: Int?
	public var title: String?
	public var price: Double?
	public var description: String?
	public var category: String?
	public var image: String?
	public var rating: Rating?
	
	public init(id: Int? = nil, title: String? = nil, price: Double? = nil, description: String? = nil, category: String? = nil, image: String? = nil, rating: Rating? = nil) {
		self.id = id
		self.title = title
		self.price = price
		self.description = description
		self.category = category
		self.image = image
		self.rating = rating
	}
	
	public static func == (lhs: Product, rhs: Product) -> Bool {
		lhs.id == rhs.id
	}
}

public struct Rating: Codable, Hashable {
	public var rate: Double?
	public var count: Int?
}

extension Product {
	
	var _id: Int {
		id ?? .zero
	}
	
	var _title: String {
		title ?? ""
	}
	
	var _price: Double {
		price ?? .zero
	}
	
	var _desc: String {
		description ?? ""
	}
	
	var _category: String {
		category ?? ""
	}
	
	var _image: String {
		image ?? ""
	}
	
	var _rating: Rating {
		rating ?? Rating(rate: .zero, count: .zero)
	}
	
}
