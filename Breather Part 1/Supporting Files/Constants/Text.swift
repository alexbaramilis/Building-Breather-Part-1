//
//  Text.swift
//  Breather Part 1
//
//  Created by Alexandros Baramilis on 11/04/2019.
//  Copyright © 2019 Alexandros Baramilis. All rights reserved.
//

import Foundation

enum Text {
    /// Returns a string describing the conditions of the range the given AQI is in.
    ///
    /// The ranges and labels are the same for AQI US and AQI China.
    static func forAQI(_ aqi: Int) -> String {
        guard let text = textForAQI[aqi] else { return "Invalid Data" }
        return text
    }
    private static let textForAQI = [
        0...50: "Good",
        51...100: "Moderate",
        101...150: "Unhealthy for Sensitive Groups",
        151...200: "Unhealthy",
        201...300: "Very Unhealthy",
        301...500: "Hazardous",
        501...Int.max: "F**k"
    ]
}
