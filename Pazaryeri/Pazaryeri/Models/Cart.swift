//
//  Cart.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 1.11.2022.
//

import Foundation

struct Cart: Codable {

	var userId: String
	var products: [Product]
}
