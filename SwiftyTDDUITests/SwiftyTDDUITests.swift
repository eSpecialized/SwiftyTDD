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
        
        let cellCountOrig = app.tables.firstMatch.cells.count
        
       //the following was a record to get my bearings.
        let swiftytddNavigationBar = app.navigationBars["SwiftyTDD"]
        swiftytddNavigationBar.buttons["Add"].tap()
        
        //lets try adding an interruption handler
        addUIInterruptionMonitor(withDescription: "Add Location") { (alert) -> Bool in
            alert.textFields.firstMatch.typeText("New York, NY")
            alert.buttons["Add"].tap()
            return true
        }
        
        app.tap()
        //sleep(1)
        
        let cellCountAdded = app.tables.firstMatch.cells.count
        
        XCTAssert(cellCountAdded > cellCountOrig, "New Cell Failed to add to the table view.")
        
        //this leads into the detail controller
        let tablesQuery = app.tables
        tablesQuery.cells.firstMatch.tap()
        
        //Now in the detail controller, lets find out.
        XCTAssert(app.navigationBars["Detail"].exists, "Fail: Not in Detail navigator yet")
        
        //adding tests for switches, labels, sliders and buttons here.
        let OnOff = app.switches["OnOff"]
        OnOff.tap() //change a switch from off to on
        
        
        let theVal = OnOff.value as! String
        XCTAssert(theVal == "1", "OnOff is not on")
        
        
        let labelStatus = app.staticTexts["Switch is on"]
        XCTAssert(labelStatus.waitForExistence(timeout: 5), "Label is missing intended value")
        
        
        //ok there is a new label GasType accessibility label.
        let labelGasType = app.staticTexts["GasType"]
        let gasType = labelGasType.label
        XCTAssert(gasType == "Premium Gas", "Only ever use Premium gas in this device")
        
        //ok lets add a button to change the gastype to something else
        let changeGas = app.buttons["ChangeGas"]
        changeGas.tap()
        let regularCheck = app.staticTexts["Regular Gas"]
        XCTAssert(regularCheck.waitForExistence(timeout: 5), "GasType label didn't change to Regular error")
        
        //lets try adding an interruption handler
        addUIInterruptionMonitor(withDescription: "Handy Alert") { (alert) -> Bool in
            alert.buttons["Okay!"].tap()
            return true
        }
        
        //lets do an alert next! and dismiss it, on dismiss it will change the text mid screen to be something else.
        app.buttons["ShowAlert"].tap()
        
        app.tap() //will cause the ui interruption monitor to fire.
        
        //app.alerts["Handy Alert"].buttons["Okay!"].tap() //swapped to the ui interruption handler
        //let mainStatus = app.staticTexts["mainStatus"]
        //let theStatus = mainStatus.label
        //XCTAssert(theStatus == "Ok Boss", "Main Status Label mid screen didn't update to expected text")
        
        let theStatus = app.staticTexts["Ok Boss"]
        XCTAssert(theStatus.waitForExistence(timeout: 5), "Main Status Label mid screen didn't update to expected text")
        
        
        //try a picker item now
        app.pickerWheels.element.adjust(toPickerWheelValue: "Salem")
        let pickerChngToSalem = app.pickerWheels.element.value as! String
        XCTAssert(pickerChngToSalem == "Salem", "Pickers selected value is incorrect, it should be salem but is " + pickerChngToSalem)
        
        
        //one new test more uislider;
        app.sliders.element.adjust(toNormalizedSliderPosition: 1.0)
        let theSliderVal = app.sliders.element.value as! String
        XCTAssert(theSliderVal == "100%", "Slider failed to adjust to proper value is " + String(theSliderVal))
        
        //textfield manipulation
        let inputField1 = app.textFields["field1"]
        inputField1.tap()
        inputField1.typeText("Fortitude")
        let outValfld1 = inputField1.value as! String
        XCTAssert(outValfld1 == "Fortitude", "Text Field Didn't update to expected result")
        
        //=== end of detail
        //navigate back to the main screen
        app.navigationBars["Detail"].buttons["SwiftyTDD"].tap()
 
        //swiftytddNavigationBar.buttons["Edit"].tap()
        tablesQuery.cells.firstMatch.swipeLeft()
        tablesQuery.buttons["Delete"].tap()
        //swiftytddNavigationBar.buttons["Done"].tap()
        
        //new test to ensure the tableview cell was removed
        let cellCountAfterDel = app.tables.firstMatch.cells.count
        XCTAssert(cellCountAfterDel == cellCountOrig , "Fsiled to remove newly added table cell")
        
    }
    
}
