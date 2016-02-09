//
//  StringExtensions.swift
//  tipster
//
//  Created by David Rothschild on 1/8/16.
//  Copyright © 2016 Dave Rothschild. All rights reserved.
//

import Foundation

extension String {
    var doubleValue: Double {
        return (self as NSString).doubleValue
    }
}

extension Double {
    /// Rounds the double to decimal places value
    func roundToPlaces(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return round(self * divisor) / divisor
    }
}