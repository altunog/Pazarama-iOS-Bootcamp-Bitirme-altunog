//
//  Product.swift
//  PazaryeriAPI
//
//  Created by Oğuz Kaan Altun on 2.11.2022.
//

import Foundation

public struct Product: Codable {
	public var id: Int?
	public var title: String?
	public var price: Double?
	public var description: String?
	public var category: String?
	public var image: String?
	public var rating: Rating?
}

public struct Rating: Codable {
	public var rate: Double?
	public var count: Int?
}
