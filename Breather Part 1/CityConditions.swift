//
//  CityConditions.swift
//  Breather Part 1
//
//  Created by Alexandros Baramilis on 11/04/2019.
//  Copyright © 2019 Alexandros Baramilis. All rights reserved.
//

import Foundation

struct CityConditions {
    let city: String
    let weather: Weather
    let pollution: Pollution
    let asthma: Asthma
}

struct Weather {
    let timestamp: String // timestamp: ex. "2018-12-04T18:00:00.000Z" (ISO 8601) (Z stands for UTC)
    let humidity: Int // humidity: 93 (%)
    let iconCode: String // weather icon code: ex. "10n"
    let pressure: Int // atmospheric pressure: ex. 1022 (hPa)
    let temperature: Int // temperature: ex. 6 (Celsius)
    let windDirection: Int // wind direction as an angle of 360° (N=0, E=90, S=180, W=270): ex. 145
    let windSpeed: Float // wind speed: ex. 2.26 (m/s)
}

struct Pollution {
    let timestamp: String // timestamp: ex. "2018-12-04T18:00:00.000Z" (ISO 8601) (Z stands for UTC)
    let aqiUS: Int // AQI value based on US EPA standard: ex. 4
    let mainPollutantUS: String // main pollutant for US AQI: ex. "o3"
    let aqiChina: Int // AQI value based on China MEP standard: ex. 3
    let mainPollutantChina: String // main pollutant for Chinese AQI: ex. "o3"
}

struct Asthma {
    let risk: String // risk of adverse respiratory conditions: "high", "medium" or "low"
    let probability: Int // probability of adverse respiratory conditions: ex. 64 (%)
}

extension CityConditions {
    static func sampleData() -> CityConditions {
        let weather = Weather(timestamp: "2019-04-10T15:00:00.000Z",
                              humidity: 40,
                              iconCode: "03d",
                              pressure: 1009,
                              temperature: 12,
                              windDirection: 310,
                              windSpeed: 7.7)
        let pollution = Pollution(timestamp: "2019-04-10T12:00:00.000Z",
                                  aqiUS: 7,
                                  mainPollutantUS: "p2",
                                  aqiChina: 3,
                                  mainPollutantChina: "p2")
        let asthma = Asthma(risk: "medium",
                            probability: 62)
        return CityConditions(city: "New York",
                              weather: weather,
                              pollution: pollution,
                              asthma: asthma)
    }
}
