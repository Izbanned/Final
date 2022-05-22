//
//  WeatherModel.swift
//  Final
//
//  Created by Dias Karimov on 22.05.2022.
//

import Foundation


struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...504:
            return "cloud.sun.rain"
        case 511:
            return "snowflake"
        case 520...531:
            return "cloud.rain"
        case 600...622:
            return "snowflake"
        case 701...781:
            return "smoke"
        case 800:
            return "sun.max"
        case 801:
            return "sun.min"
        case 802:
            return "cloud"
        case 803:
            return "smoke"
        case 804:
            return "smoke.fill"
        default:
            return "cloud"
        }
    }
}
