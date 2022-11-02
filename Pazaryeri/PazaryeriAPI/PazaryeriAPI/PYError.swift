//
//  PYError.swift
//  PazaryeriAPI
//
//  Created by Oğuz Kaan Altun on 2.11.2022.
//

import Foundation

enum PYError: String, Error {
	case invalidEnpoint 	= "Invalid endpoint. Please try again, and contact our support team if the problem persists."
	case invalidResponse	= "Invalid response from the service. Please try again."
	case invalidData 		= "The data received from the server was invalid. Please try again."
	case unableToComplete 	= "Unable to complete your request. Please check your internet connection"
}
