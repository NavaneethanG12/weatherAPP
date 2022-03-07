//
//  WeatherFetcher.swift
//  WeatherApp
//
//  Created by navaneeth-pt4855 on 06/03/22.
//

import Foundation

class WeatherFetcher{
    
    var urlString: String?
    
    var delegate: WeatherFetcherDelegate?
    
    init(urlString: String){
        self.urlString = urlString
    }
    
    func parseData(){
        guard let urlString = urlString else {
            return
        }
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let dataTask = session.dataTask(with: url) { data, response, error in
                
                if error != nil{
                    print(error)
                    return
                }
                
                if let data = data {
                    self.parseJson(data)
                }
                
            }
            dataTask.resume()
            
        }
        
        
    }
    
    func parseJson(_ data: Data){
        
        let jsonDecoder = JSONDecoder()
        
        do{
            let weatherData = try jsonDecoder.decode(WeatherData.self, from: data)
            delegate?.didUpdateWeather(data: weatherData)
        }catch{
            print(error)
        }
        
    }
    
}
