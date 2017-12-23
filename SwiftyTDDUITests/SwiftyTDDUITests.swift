//
//  SwiftyTDDUITests.swift
//  SwiftyTDDUITests
//
//  Created by William Thompson on 12/22/17.
//  Copyright © 2017 William Thompson. All rights reserved.
//

import XCTest

class SwiftyTDDUITests: XCTestCase {
        let app = XCUIApplication()
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDriveDesign() {
        //first test is title, in TDD we write the test first then change things to match till the test passes.
        print(app.debugDescription)
        let navBar = app.navigationBars.element.identifier
        XCTAssert(navBar == "SwiftyTDD", "App Title does not match intended App Name")
        
    }
    
}