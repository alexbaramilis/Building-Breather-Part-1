//
//  String+Extension.swift
//  Breather Part 1
//
//  Created by Alexandros Baramilis on 11/04/2019.
//  Copyright © 2019 Alexandros Baramilis. All rights reserved.
//

import Foundation

extension String {
    /// Returns the indices of all the decimal digits in the string.
    var indicesOfDecimalDigits: [Int] {
        var indices = [Int]()
        var searchStartIndex = self.startIndex
        while searchStartIndex < self.endIndex,
            let range = self.rangeOfCharacter(from: CharacterSet.decimalDigits, range: searchStartIndex..<self.endIndex),
            !range.isEmpty
        {
            let index = distance(from: self.startIndex, to: range.lowerBound)
            indices.append(index)
            searchStartIndex = range.upperBound
        }
        return indices
    }
}
