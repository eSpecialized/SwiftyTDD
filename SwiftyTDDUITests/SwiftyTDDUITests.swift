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
        print(self.app.debugDescription)
        let navBar = self.app.navigationBars.element.identifier
        XCTAssert(navBar == "SwiftyTDD", "App Title does not match intended App Name")
        
       //the following was a record to get my bearings.
        let app = XCUIApplication()
        let swiftytddNavigationBar = app.navigationBars["SwiftyTDD"]
        swiftytddNavigationBar.buttons["Add"].tap()
        
        //this leads into the detail controller
        let tablesQuery = app.tables
        tablesQuery.cells.firstMatch.tap()
        
        //adding tests for switches, labels, sliders and buttons here.
        let OnOff = app.switches["OnOff"]
        OnOff.tap() //change a switch from off to on
        
        let labelStatus = app.staticTexts["Status"]
        let theVal = OnOff.value as! String
        XCTAssert(theVal == "1", "OnOff is not on")
        
        
        //navigate back to the main screen
        app.navigationBars["Detail"].buttons["SwiftyTDD"].tap()
 
        //swiftytddNavigationBar.buttons["Edit"].tap()
        tablesQuery.cells.firstMatch.swipeLeft()
        tablesQuery.buttons["Delete"].tap()
        //swiftytddNavigationBar.buttons["Done"].tap()
        
    }
    
}
