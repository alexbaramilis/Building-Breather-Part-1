//
//  Color.swift
//  Breather Part 1
//
//  Created by Alexandros Baramilis on 11/04/2019.
//  Copyright © 2019 Alexandros Baramilis. All rights reserved.
//

import UIKit

enum Color {
    /// Returns a color corresponding to the range the given temperature is in.
    static func forTemperature(_ temperature: Int) -> UIColor {
        guard let color = colorForTemperature[temperature] else { return UIColor.black }
        return color
    }
    private static let colorForTemperature = [
        Int.min...0: UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1),
        1...10: UIColor(red: 74/255, green: 194/255, blue: 226/255, alpha: 1),
        11...20: UIColor(red: 126/255, green: 211/255, blue: 33/255, alpha: 1),
        21...30: UIColor(red: 237/255, green: 222/255, blue: 41/255, alpha: 1),
        31...40: UIColor(red: 245/255, green: 166/255, blue: 35/255, alpha: 1),
        40...Int.max: UIColor(red: 211/255, green: 76/255, blue: 92/255, alpha: 1)
    ]

    /// Returns a color corresponding to the range the given AQI is in.
    ///
    /// The ranges and colors are the same for AQI US and AQI China.
    static func forAQI(_ aqi: Int) -> UIColor {
        guard let color = colorForAQI[aqi] else { return UIColor.black }
        return color
    }
    private static let colorForAQI = [
        0...50: UIColor(red: 126/255, green: 211/255, blue: 33/255, alpha: 1),
        51...100: UIColor(red: 237/255, green: 222/255, blue: 41/255, alpha: 1),
        101...150: UIColor(red: 245/255, green: 166/255, blue: 35/255, alpha: 1),
        151...200: UIColor(red: 211/255, green: 76/255, blue: 92/255, alpha: 1),
        201...300: UIColor(red: 155/255, green: 111/255, blue: 193/255, alpha: 1),
        301...500: UIColor(red: 156/255, green: 62/255, blue: 88/255, alpha: 1),
        501...Int.max: UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
    ]

    /// Returns a color corresponding to the asthma risk level.
    static func forAsthmaRisk(_ risk: String) -> UIColor {
        guard let color = colorForAsthmaRisk[risk] else { return UIColor.black }
        return color
    }
    private static let colorForAsthmaRisk = [
        "low": UIColor(red: 126/255, green: 211/255, blue: 33/255, alpha: 1),
        "medium": UIColor(red: 245/255, green: 166/255, blue: 35/255, alpha: 1),
        "high": UIColor(red: 211/255, green: 76/255, blue: 92/255, alpha: 1)
    ]
}
