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
	var cart: [Int: Int]
	var previousOrders: [[Int: Int]]
	var activeOrders: [[Int: Int]]
}
