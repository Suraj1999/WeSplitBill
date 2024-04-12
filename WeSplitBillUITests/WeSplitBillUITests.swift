//
//  WeSplitBillUITests.swift
//  WeSplitBillUITests
//
//  Created by Suraj Gupta on 12/04/24.
//

import XCTest

final class when_content_view_is_shown: XCTestCase {
       
    var app: XCUIApplication!
    
    override func setUp() async throws {
        
         app = XCUIApplication()
        
        continueAfterFailure = false
    
    }
    
    func test_should_make_sure_textField_contains_default_value() {
        
        app.launch()
        let amountField = app.textFields["amoutTextFiled"]
        XCTAssertEqual(amountField.value as! String, "₹ 0.00")
    }
    
    func test_should_make_sure_default_tip_value_selected_is_20() {
        
        app.launch()
        let tipValue = app.segmentedControls["tipPercent"]
        let segmentedControl = tipValue.buttons.element(boundBy: 2)
        XCTAssertEqual(segmentedControl.label, "20%")
        XCTAssertTrue(segmentedControl.isSelected)
    }
    
}

class when_claculate_button_is_tapped: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() async throws {
        
        
        
      
        
    }
    
    func test_should_make_sure_final_total_per_person_is_displayed() {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        let amountField = app.textFields["amoutTextFiled"]
        amountField.tap()
        amountField.typeText("100")
        
        let button = app.buttons["calculateButton"]
        button.tap()
        let text = app.staticTexts["finalAmt"]
        let _ = text.waitForExistence(timeout: 0.5)
        print(text.label)
    }
}
