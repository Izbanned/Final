//
//  WeatherData.swift
//  Final
//
//  Created by Dias Karimov on 22.05.2022.
//

import Foundation


struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
    
}
