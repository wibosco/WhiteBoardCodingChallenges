//
//  PlusMinusTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by Home on 07/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class PercentagesTests: XCTestCase {
    
    // MARK: TestLifecycle
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    // MARK: Tests
    
    func test_percentages() {
        
        let percentages = Percentages.percentageOfUnqiueSets([-4, 3, -9, 0, 4, 1])
        
        XCTAssertEqualWithAccuracy(0.500000, percentages.positivePercentage, accuracy: 0.000001, "Postive percentage did not match expected result")
        XCTAssertEqualWithAccuracy(0.333333, percentages.negativePercentage, accuracy: 0.000001, "Negative percentage did not match expected result")
        XCTAssertEqualWithAccuracy(0.166667, percentages.zeroPercentage, accuracy: 0.000001, "Postive percentage did not match expected result")
    }
    
}
