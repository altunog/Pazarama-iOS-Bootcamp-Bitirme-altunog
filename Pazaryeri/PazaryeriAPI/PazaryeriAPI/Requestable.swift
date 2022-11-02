//
//  Requestable.swift
//  PazaryeriAPI
//
//  Created by Oğuz Kaan Altun on 2.11.2022.
//

import Foundation

protocol Requestable {
	associatedtype Response
	
	var baseURL: String { get }
	var path: String { get }
	var method: HTTPMethod { get }
	var headers: [String: String] { get }
	var queryItems: [String: String] { get }
	
	func decode(_ data: Data) throws -> Response
}


extension Requestable {
	
	var header: [String: String] {
		[:]
	}
	
	var queryItems: [String: String] {
		[:]
	}
}

extension Requestable where Response: Decodable {
	
	func decode(_ data: Data) throws -> Response {
		let decoder = JSONDecoder()
		return try decoder.decode(Response.self, from: data)
	}
}
