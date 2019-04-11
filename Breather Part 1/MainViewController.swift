//
//  MainViewController.swift
//  Breather Part 1
//
//  Created by Alexandros Baramilis on 11/04/2019.
//  Copyright © 2019 Alexandros Baramilis. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Outlets

    // Views
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var windDirectionImageView: UIImageView!
    @IBOutlet weak var airQualityLabel: UILabel!
    @IBOutlet weak var aqiUSLabel: UILabel!
    @IBOutlet weak var aqiChinaLabel: UILabel!
    @IBOutlet weak var mainPollutantsLabel: UILabel!
    @IBOutlet weak var asthmaRiskLabel: UILabel!
    @IBOutlet weak var asthmaProbabilityLabel: UILabel!

    // Constraints
    @IBOutlet weak var contentViewHeight: NSLayoutConstraint!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        populateUI(with: CityConditions.sampleData())
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        contentViewHeight.constant = view.bounds.height > 504 ? view.bounds.height : 504
    }
}

// MARK: - Sample data

extension MainViewController {
    private func populateUI(with data: CityConditions) {
        cityLabel.text = data.city
        weatherImageView.image = UIImage(named: Asset.forIconCode(data.weather.iconCode))
        temperatureLabel.text = "\(data.weather.temperature)℃"
        temperatureLabel.textColor = Color.forTemperature(data.weather.temperature)
        humidityLabel.text = "Humidity: \(data.weather.humidity)%"
        pressureLabel.text = "Pressure: \(data.weather.pressure) hPa"
        windLabel.text = "Wind: \(data.weather.windSpeed) m/s"
        let rotationAngle = (CGFloat(data.weather.windDirection) * .pi) / 180.0
        windDirectionImageView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        airQualityLabel.text = Text.forAQI(data.pollution.aqiUS)
        airQualityLabel.textColor = Color.forAQI(data.pollution.aqiUS)
        aqiUSLabel.text = "AQI (US): \(data.pollution.aqiUS)"
        aqiChinaLabel.text = "AQI (China): \(data.pollution.aqiChina)"
        mainPollutantsLabel.setAttributedTextWithSubscriptDecimalDigits(text: "Main pollutants: \(data.pollution.mainPollutantUS.uppercased())")
        asthmaRiskLabel.text = data.asthma.risk.capitalized
        asthmaRiskLabel.textColor = Color.forAsthmaRisk(data.asthma.risk)
        asthmaProbabilityLabel.text = "Probability: \(data.asthma.probability)%"
    }
}
