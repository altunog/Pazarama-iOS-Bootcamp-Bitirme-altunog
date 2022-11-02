//
//  NetworkManager.swift
//  PazaryeriAPI
//
//  Created by Oğuz Kaan Altun on 2.11.2022.
//

import Foundation

class NetworkManager {
	
	static let shared = NetworkManager()
	
	private init() {}

	func getContent<R: Requestable>(for request: R, completion: @escaping (Result<R.Response, PYError>) -> Void) {
		
		guard var urlComponents = URLComponents(string: request.baseURL + request.path) else {
			completion(.failure(.invalidEnpoint))
			return
		}
		
		var queryItems = [URLQueryItem]()
		for (key, value) in request.queryItems {
			let queryItem = URLQueryItem(name: key, value: value)
			queryItems.append(queryItem)
		}
		
		urlComponents.queryItems = queryItems
		
		guard let url = urlComponents.url else {
			completion(.failure(.invalidEnpoint))
			return
		}
		
		let task = URLSession.shared.dataTask(with: url) { data, respone, error in
			if error != nil {
				completion(.failure(.unableToComplete))
				return
			}
			
			guard let respone = respone as? HTTPURLResponse,
				  200..<300 ~= respone.statusCode else {
				completion(.failure(.invalidResponse))
				return
			}
			
			guard let data else {
				completion(.failure(.invalidData))
				return
			}
			
			do {
				try completion(.success(request.decode(data)))
			} catch {
				completion(.failure(.invalidData))
			}
		}
		task.resume()
		
	}
}
