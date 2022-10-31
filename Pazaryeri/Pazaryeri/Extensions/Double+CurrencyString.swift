//
//  Double+CurrencyString.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 30.10.2022.
//

import Foundation

extension Double {
	
	var currencyString: String {
		let formmatter = NumberFormatter()
		formmatter.numberStyle = .currency
		if self >= 0,
		   let formattedString = formmatter.string(from: self as NSNumber) {
			return formattedString
		} else {
			return "Price not available"
		}
	}
}
