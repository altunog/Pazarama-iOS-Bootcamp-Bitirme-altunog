//
//  PazaryeriService.swift
//  PazaryeriAPI
//
//  Created by Oğuz Kaan Altun on 2.11.2022.
//

import Foundation
import Moya

public let pazaryeriServiceProvider = MoyaProvider<PazaryeriService>()

public enum PazaryeriService {
	case getProducts
	case getSingleProduct(id: String)
}

extension PazaryeriService: TargetType {
	public var baseURL: URL {
		URL(string: "https://fakestoreapi.com")!
	}
	
	public var path: String {
		switch self {
		case .getProducts:
			return "/products"
		case .getSingleProduct(let id):
			return "/product/\(id)"
		}
	}
	
	public var method: Moya.Method {
		.get
	}
	
	public var task: Moya.Task {
		switch self {
		case .getProducts:
			return .requestPlain
		case .getSingleProduct:
			return .requestPlain
		}
	}
	
	public var headers: [String : String]? {
		nil
	}
	
}
