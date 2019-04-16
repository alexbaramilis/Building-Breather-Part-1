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
    @IBOutlet weak var aqiLabel: UILabel!
    @IBOutlet weak var mainPollutantLabel: UILabel!
    @IBOutlet weak var aqiStandardSegmentedControl: UISegmentedControl!
    @IBOutlet weak var asthmaRiskLabel: UILabel!
    @IBOutlet weak var asthmaProbabilityLabel: UILabel!

    // Constraints
    @IBOutlet weak var contentViewHeight: NSLayoutConstraint!

    // MARK: - Actions

    @IBAction func aqiStandardSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        updateAirQualityUI()
    }

    // MARK: - Properties

    private let data = CityConditions.sampleData()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        contentViewHeight.constant = view.bounds.height > 504 ? view.bounds.height : 504
    }

    // MARK: - Methods

    private func updateUI() {
        cityLabel.text = data.city
        updateWeatherUI()
        updateAirQualityUI()
        updateAsthmaUI()
    }

    private func updateWeatherUI() {
        weatherImageView.image = UIImage(named: Asset.forIconCode(data.weather.iconCode))
        temperatureLabel.text = "\(data.weather.temperature)℃"
        temperatureLabel.textColor = Color.forTemperature(data.weather.temperature)
        humidityLabel.text = "Humidity: \(data.weather.humidity)%"
        pressureLabel.text = "Pressure: \(data.weather.pressure) hPa"
        windLabel.text = "Wind: \(data.weather.windSpeed) m/s"
        let rotationAngle = (CGFloat(data.weather.windDirection) * .pi) / 180.0
        windDirectionImageView.transform = CGAffineTransform(rotationAngle: rotationAngle)
    }

    private func updateAirQualityUI() {
        if aqiStandardSegmentedControl.selectedSegmentIndex == 0 {
            airQualityLabel.text = Text.forAQI(data.pollution.aqiUS)
            airQualityLabel.textColor = Color.forAQI(data.pollution.aqiUS)
            aqiLabel.text = "AQI: \(data.pollution.aqiUS)"
            let text = "Main pollutant: \(Text.forMainPollutant(data.pollution.mainPollutantUS))"
            mainPollutantLabel.setAttributedTextWithSubscripts(text: text,
                                                               indicesOfSubscripts: text.indicesOfNumbers)
        } else if aqiStandardSegmentedControl.selectedSegmentIndex == 1 {
            airQualityLabel.text = Text.forAQI(data.pollution.aqiChina)
            airQualityLabel.textColor = Color.forAQI(data.pollution.aqiChina)
            aqiLabel.text = "AQI: \(data.pollution.aqiChina)"
            let text = "Main pollutant: \(Text.forMainPollutant(data.pollution.mainPollutantChina))"
            mainPollutantLabel.setAttributedTextWithSubscripts(text: text,
                                                               indicesOfSubscripts: text.indicesOfNumbers)
        }
    }

    private func updateAsthmaUI() {
        asthmaRiskLabel.text = data.asthma.risk.capitalized
        asthmaRiskLabel.textColor = Color.forAsthmaRisk(data.asthma.risk)
        asthmaProbabilityLabel.text = "Probability: \(data.asthma.probability)%"
    }
}
