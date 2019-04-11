//
//  Asset
//  Breather Part 1
//
//  Created by Alexandros Baramilis on 11/04/2019.
//  Copyright © 2019 Alexandros Baramilis. All rights reserved.
//

import Foundation

enum Asset {
    /// Returns the asset name for the weather icon corresponding to the icon code.
    ///
    /// Some icon codes have the same weather icon representing them.
    static func forIconCode(_ iconCode: String) -> String {
        guard let asset = assetForIconCode[iconCode] else { return "" }
        return asset
    }
    private static let assetForIconCode = [
        "01d": "01d.png", // clear sky (day)
        "01n": "01n.png", // clear sky (night)
        "02d": "02d.png", // few clouds (day)
        "02n": "02n.png", // few clouds (night)
        "03d": "03d.png", // scattered clouds (day)
        "03n": "03d.png", // same icon for night
        "04d": "04d.png", // broken clouds (day)
        "04n": "04d.png", // same icon for night
        "09d": "09d.png", // shower rain (day)
        "09n": "09d.png", // same icon for night
        "10d": "10d.png", // rain (day)
        "10n": "10n.png", // rain (night)
        "11d": "11d.png", // thunderstorm (day)
        "11n": "11d.png", // same icon for night
        "13d": "13d.png", // snow (day)
        "13n": "13d.png", // same icon for night
        "50d": "50d.png", // mist (day)
        "50n": "50d.png"  // same icon for night
    ]
}
