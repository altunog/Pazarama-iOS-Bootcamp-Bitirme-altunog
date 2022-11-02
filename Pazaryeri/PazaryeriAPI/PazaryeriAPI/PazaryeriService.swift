//
//  PazaryeriService.swift
//  PazaryeriAPI
//
//  Created by Oğuz Kaan Altun on 2.11.2022.
//

import Foundation
import Moya

enum PazaryeriService {
	case getProducts
}

extension PazaryeriService: TargetType {
	var baseURL: URL {
		URL(string: "https://fakestoreapi.com")!
	}
	
	var path: String {
		switch self {
		case .getProducts:
			return "/products"
		}
	}
	
	var method: Moya.Method {
		switch self {
		case .getProducts:
			return .get
		}
	}
	
	var task: Moya.Task {
		switch self {
		case .getProducts:
			return .requestPlain
		}
	}
	
	var headers: [String : String]? {
		nil
	}
	
	
}
