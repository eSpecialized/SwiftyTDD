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
        
       //the following was a record to get my bearings.
        let app = XCUIApplication()
        let swiftytddNavigationBar = app.navigationBars["SwiftyTDD"]
        swiftytddNavigationBar.buttons["Add"].tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["2017-12-23 05:40:25 +0000"]/*[[".cells.staticTexts[\"2017-12-23 05:40:25 +0000\"]",".staticTexts[\"2017-12-23 05:40:25 +0000\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Detail"].buttons["SwiftyTDD"].tap()
        swiftytddNavigationBar.buttons["Edit"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Delete 2017-12-23 05:40:25 +0000"]/*[[".cells.buttons[\"Delete 2017-12-23 05:40:25 +0000\"]",".buttons[\"Delete 2017-12-23 05:40:25 +0000\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery.buttons["Delete"].tap()
        swiftytddNavigationBar.buttons["Done"].tap()
        
    }
    
}
