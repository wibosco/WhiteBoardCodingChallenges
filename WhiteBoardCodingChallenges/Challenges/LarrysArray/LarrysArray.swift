//
//  LarrysArray.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 12/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//https://www.hackerrank.com/challenges/larrys-array
class LarrysArray: NSObject {

    enum Sequence: Int {
        case BCA
        case CAB
        
        static let count: Int = {
            
            var max: Int = 0
            while let _ = Sequence(rawValue: max) {
                
                max += 1
            }
            
            return max
        }()
    }
    
    class func canRobotSort(values: [Int]) -> Bool {
        
        var valuesAfterRotation = values
    
        for index in 0..<(values.count - 2) {
        
            valuesAfterRotation = LarrysArray.attemptToMoveValueIntoPosition(valuesAfterRotation, valueToMove: (index + 1))
            
            if index > 0 {
                
                if valuesAfterRotation[(index - 1)] > valuesAfterRotation[index]  {
                    
                    return false
                }
            }
        }
        
        if valuesAfterRotation[(valuesAfterRotation.count - 1)] > valuesAfterRotation[(valuesAfterRotation.count - 2)] {
            
            return true
        }
        else {
            
            return false
        }
    }
    
    class func attemptToMoveValueIntoPosition(values: [Int], valueToMove: Int) -> [Int] {
        
        let index = values.indexOf(valueToMove)!
        
        if index == (valueToMove - 1) {
            
            return values
        }
        else {
            
            let indexValueShouldBeMovedTo = (valueToMove - 1)
            
            if index == (indexValueShouldBeMovedTo + 1) {
                
                return rotate(values, sequence: .BCA, startingIndex: indexValueShouldBeMovedTo)
            }
            else if index == (indexValueShouldBeMovedTo + 2) {
            
                return rotate(values, sequence: .CAB, startingIndex: indexValueShouldBeMovedTo)
            }
            else {
                
                let valuesAfterRotation = rotate(values, sequence: .CAB, startingIndex: (index - 2))
                
                return attemptToMoveValueIntoPosition(valuesAfterRotation, valueToMove: valueToMove)
            }
        }
    }
    
    class func rotate(values: [Int], sequence: Sequence, startingIndex: Int) -> [Int] {
        
        var rotatedValues = values
        
        let indexOfABeforeRotation = startingIndex
        let indexOfBBeforeRotation = startingIndex + 1
        let indexOfCBeforeRotation = startingIndex + 2
        
        switch sequence {
        case .BCA:
        
            let indexOfAAfterRotation = startingIndex + 2
            let indexOfBAftereRotation = startingIndex
            let indexOfCAfterRotation = startingIndex + 1
            
            rotatedValues[indexOfAAfterRotation] = values[indexOfABeforeRotation]
            rotatedValues[indexOfBAftereRotation] = values[indexOfBBeforeRotation]
            rotatedValues[indexOfCAfterRotation] = values[indexOfCBeforeRotation]
            
        case .CAB:
            
            let indexOfAAfterRotation = startingIndex + 1
            let indexOfBAftereRotation = startingIndex + 2
            let indexOfCAfterRotation = startingIndex
            
            rotatedValues[indexOfAAfterRotation] = values[indexOfABeforeRotation]
            rotatedValues[indexOfBAftereRotation] = values[indexOfBBeforeRotation]
            rotatedValues[indexOfCAfterRotation] = values[indexOfCBeforeRotation]
        }
        
        return rotatedValues
    }
}