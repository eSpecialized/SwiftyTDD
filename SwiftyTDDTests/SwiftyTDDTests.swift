//
//  SwiftyTDDTests.swift
//  SwiftyTDDTests
//
//  Created by William Thompson on 12/22/17.
//  Copyright © 2017 William Thompson. All rights reserved.
//

import XCTest
@testable import SwiftyTDD

class SwiftyTDDTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testWoodburnWeather() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let wunder = Wunderground()
        wunder.state = "OR"
        wunder.location = "Woodburn"
        
        var wResult: Bool = false
        let expectationOut = expectation(description: "Temperature data is retrieved")
        do {
              wResult = try wunder.getTemp { (inTemp) in
                XCTAssertFalse(inTemp.isEmpty)
                if !inTemp.isEmpty {
                    expectationOut.fulfill()
                    print("Temp retrieved is : " + inTemp)
                }
            }
        } catch let Error {
            print(Error)
        }
        
        
        XCTAssertTrue(wResult == true, "Failed to initiate weather request error.")
        
        waitForExpectations(timeout: 10) { (errors) in
            if let errors = errors {
                XCTFail("Temperature failed to retrieve in call back \(errors)" )
            }
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
