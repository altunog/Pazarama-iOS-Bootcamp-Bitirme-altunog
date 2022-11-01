//
//  User.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 1.11.2022.
//

import Foundation

struct User: Codable {
	
	var username: String
	var email: String
	var cart: Cart?
	var previousOrders: [Cart]?
	var activeOrders: [Cart]?
}
