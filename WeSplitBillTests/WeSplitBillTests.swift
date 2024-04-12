//
//  WeSplitBillTests.swift
//  WeSplitBillTests
//
//  Created by Suraj Gupta on 12/04/24.
//

import XCTest
@testable import WeSplitBill

final class when_calculating_tip_when_amount_enetered_is_correct: XCTestCase {

    func test_calculating_tip_amount_succesfully() {
        
        let totalPerPerson = TotalPerPerson()
        let tipValue = try! totalPerPerson.calculateTip(amount: 100, tipPercent: 10)
        XCTAssertEqual(tipValue, 10)
        
    }
    
    func test_calculating_tip_when_tip_percent_is_negative_value() {
        
        let totalPerPerson = TotalPerPerson()
        XCTAssertThrowsError(try totalPerPerson.calculateTip(amount: 100, tipPercent: -20), "") { error in
            XCTAssertEqual(error as! TipCalculateError, TipCalculateError.invalidInput)
        }
    }

}

class when_calculating_tip_when_amount_entered_is_negative: XCTestCase{
    
    func test_should_throw_invalid_input_exception() {
        
        let totalPerPerson = TotalPerPerson()
        XCTAssertThrowsError(try totalPerPerson.calculateTip(amount: -100, tipPercent: 10), "") { error in
            XCTAssertEqual(error as! TipCalculateError, TipCalculateError.invalidInput)
        }
    }
    
}

class when_calculating_total_amount_per_person_succesfully: XCTestCase {
    
    func test_should_calculate_total_amount_per_person() {
        
        let totalPerPerson = TotalPerPerson()
        let finalAmount = try! totalPerPerson.calculateFinalAmount(amount: 100, tipPercent: 20, totalPerson: 3)
        XCTAssertEqual(finalAmount, 40)
    }
    
    func test_should_throw_invalid_input_when_number_of_people_is_less_than_1() {
        
        let totalPerPerson = TotalPerPerson()
        XCTAssertThrowsError(try totalPerPerson.calculateFinalAmount(amount: 100, tipPercent: 10, totalPerson: 0), "") { error in
            XCTAssertEqual(error as! TipCalculateError, TipCalculateError.invalidInput)
        }
    }
}
