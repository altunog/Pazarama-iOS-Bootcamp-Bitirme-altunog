//
//  Encodable+Dictionary.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 5.11.2022.
//

import Foundation

extension Encodable {

	var dictionary: [String: Any] {
		let data = (try? JSONEncoder().encode(self)) ?? Data()
		return (try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]) ?? [:]
	}
}
