//
//  WeatherFetcherDelegate.swift
//  WeatherApp
//
//  Created by navaneeth-pt4855 on 06/03/22.
//

import Foundation

protocol WeatherFetcherDelegate{
    func didUpdateWeather(data: WeatherData)
}
