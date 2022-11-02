//
//  PazaryeriAPITests.swift
//  PazaryeriAPITests
//
//  Created by Oğuz Kaan Altun on 1.11.2022.
//

import XCTest
@testable import PazaryeriAPI

final class PazaryeriAPITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
		let bundle = Bundle(for: PazaryeriAPITests.self)
		let url = bundle.url(forResource: "product", withExtension: "json")!
		let data = try Data(contentsOf: url)
		let products = try JSONDecoder().decode([Product].self, from: data)
		print(products)
		
		XCTAssertEqual(products.count, 1, "Unexpected product number.")
		XCTAssertEqual(products.first?.id, 1, "Unexpected id.")
		XCTAssertEqual(products.first?.title, "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops", "Unexpected title.")
		XCTAssertEqual(products.first?.price, 109.95, "Unexpected price.")
		XCTAssertEqual(products.first?.description, "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday", "Unexpected description.")
		XCTAssertEqual(products.first?.category, "men's clothing", "Unexpected category.")
		XCTAssertEqual(products.first?.image, "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", "Unexpected image.")
		XCTAssertEqual(products.first?.rating?.rate, 3.9, "Unexpected rate item of rating.")
		XCTAssertEqual(products.first?.rating?.count, 120, "Unexpected count item of rating.")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
