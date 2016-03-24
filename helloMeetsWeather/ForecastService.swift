//
//  ForecastService.swift
//  helloMeetsWeather
//
//  Created by Robin Malhotra on 24/03/16.
//  Copyright © 2016 Robin Malhotra. All rights reserved.
//

import Foundation

struct ForecastService {
    let APIkey : String
    
    init(key:String)
    {
        APIkey = key
    }
    
    func getForecast(completion: (weatherData? -> Void))
    {
        let nrm = NetworkRequestManager()
        nrm.downloadFromURL("https://api.forecast.io/forecast/\(APIkey)/28.6,77.2") { (let dict) in
            guard let currentDict = dict?["currently"] as? [String:AnyObject]
            else {
                print("well, shit")
                return
            }
            let currentWeather = weatherData(resultJSONDict: currentDict)
            completion(currentWeather)
        }
    }
}