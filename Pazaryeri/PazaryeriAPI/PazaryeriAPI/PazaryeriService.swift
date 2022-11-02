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
}

extension PazaryeriService: TargetType {
	public var baseURL: URL {
		URL(string: "https://fakestoreapi.com")!
	}
	
	public var path: String {
		switch self {
		case .getProducts:
			return "/products"
		}
	}
	
	public var method: Moya.Method {
		switch self {
		case .getProducts:
			return .get
		}
	}
	
	public var task: Moya.Task {
		switch self {
		case .getProducts:
			return .requestPlain
		}
	}
	
	public var headers: [String : String]? {
		nil
	}
	
	
}
