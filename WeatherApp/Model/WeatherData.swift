//
//  WeatherData.swift
//  WeatherApp
//
//  Created by navaneeth-pt4855 on 06/03/22.
//

import Foundation

struct WeatherData: Codable{
    var coord: Coordinates
    var weather: [Weather]
    var main: Main
    var name: String
}

struct Coordinates: Codable{
    var lon: Double
    var lat: Double
}

struct Weather: Codable{
    var id: Int
    var main: String
    var description: String
}

struct Main: Codable{
    var temp: Double
}
