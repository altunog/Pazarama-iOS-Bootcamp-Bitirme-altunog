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
	
	public static func == (lhs: Product, rhs: Product) -> Bool {
		lhs.id == rhs.id
	}
}

public struct Rating: Codable, Hashable {
	public var rate: Double?
	public var count: Int?
}
