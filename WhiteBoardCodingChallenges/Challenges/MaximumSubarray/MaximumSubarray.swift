//
//  MaximumSubarray.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 10/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class MaximumSubarray: NSObject {

    class func maximumTotals(array: [Int]) -> (contiguousTotal: Int, nonContiguousTotal: Int) {
    
        let contiguousTotal = MaximumSubarray.maximumContiguous(array: array)
        let nonContiguousTotal = MaximumSubarray.maximumNonContiguousTotal(array: array)
        
        return (contiguousTotal, nonContiguousTotal)
    }
    
    class func maximumNonContiguousTotal(array: [Int]) -> Int {
        
        var nonContiguousTotal = array[0]
        
        if array.count > 1 {
         
            for value in array[1..<array.count] {
                
                if nonContiguousTotal > 0 {
                    
                    nonContiguousTotal = max(nonContiguousTotal, (nonContiguousTotal + value))
                }
                else {
                    
                    nonContiguousTotal = max(nonContiguousTotal, value)
                }
            }
        }
        
        return nonContiguousTotal
    }
    
    class func maximumContiguous(array: [Int]) -> Int {
        
        var contiguousTotal = array[0]
        
        if array.count > 1 {
            
            var currentTotal = array[0]
            
            for value in array[1..<array.count] {
                
                currentTotal = max(value, (currentTotal + value))
                contiguousTotal = max(contiguousTotal, currentTotal)
            }
        }

        return contiguousTotal
    }
    
}
