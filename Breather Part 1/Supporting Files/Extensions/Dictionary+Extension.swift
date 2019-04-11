//
//  Dictionary+Extension.swift
//  Breather Part 1
//
//  Created by Alexandros Baramilis on 11/04/2019.
//  Copyright © 2019 Alexandros Baramilis. All rights reserved.
//

import Foundation

extension Dictionary where Key == CountableClosedRange<Int> {
    /// Enables us to use ranges of Int (CountableClosedRange<Int>) as keys for dictionaries.
    subscript(rawValue: Int) -> Value? {
        for key in keys where key ~= rawValue {
            return self[key]
        }
        return nil
    }
}
