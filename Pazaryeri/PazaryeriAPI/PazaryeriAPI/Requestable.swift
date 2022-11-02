//
//  Requestable.swift
//  PazaryeriAPI
//
//  Created by Oğuz Kaan Altun on 2.11.2022.
//

import Foundation

protocol Requestable {
	
	var baseURL: String { get }
	var path: String { get }
	var method: HTTPMethod { get }
	var headers: [String: String] { get }
	var queryItems: [String: String] { get }
}


extension Requestable {
	
	var header: [String: String] {
		[:]
	}
	
	var queryItems: [String: String] {
		[:]
	}
}
