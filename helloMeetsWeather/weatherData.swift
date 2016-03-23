//
//  weatherData.swift
//  helloMeetsWeather
//
//  Created by Robin Malhotra on 24/03/16.
//  Copyright © 2016 Robin Malhotra. All rights reserved.
//

import UIKit

enum Icon: String
{
    case ClearDay = "clear-day"
    case ClearNight = "clear-night"
    case Rain = "rain"
    case Snow = "snow"
    case Sleet = "sleet"
    case Wind = "wind"
    case Fog = "fog"
    case Cloudy = "cloudy"
    case PartlyCloudyDay = "partly-cloudy-day"
    case PartlyCloudyNight = "partly-cloudy-night"
    
    func toImage() -> UIImage?
    {
        var imageName: String
        
        switch self {
        case .ClearDay:
            imageName = "clear-day.png"
        case .ClearNight:
            imageName = "clear-night.png"
        case .Rain:
            imageName = "rain.png"
        case .Snow:
            imageName = "snow.png"
        case .Sleet:
            imageName = "sleet.png"
        case .Wind:
            imageName = "wind.png"
        case .Fog:
            imageName = "fog.png"
        case .Cloudy:
            imageName = "cloudy.png"
        case .PartlyCloudyDay:
            imageName = "cloudy-day.png"
        case .PartlyCloudyNight:
            imageName = "cloudy-night.png"
        }
        
        return UIImage(named: imageName)
    }
}

struct weatherData
{
    let temp :Float?
    let PrecipIntensity :Float?
    let PrecipProb :Float?
    let dewP :Float?
    let humidity :Float?
    let cloudCover :Float?
    let ozone :Float?
    let visibility :Float?
    let windSpeed :Float?
    let summary :String?
    var icon = UIImage(named: "default")
    
    init(resultJSONDict:[String:AnyObject])
    {
        temp = resultJSONDict["temperature"] as? Float
        PrecipIntensity = resultJSONDict["precipIntensity"] as? Float
        PrecipProb = resultJSONDict["precipProbability"] as? Float
        dewP = resultJSONDict["dewPoint"] as? Float
        humidity = resultJSONDict["humidity"] as? Float
        cloudCover = resultJSONDict["cloudCover"] as? Float
        ozone = resultJSONDict["ozone"] as? Float
        visibility = resultJSONDict["visibility"] as? Float
        windSpeed = resultJSONDict["windSpeed"] as? Float
        summary = resultJSONDict["summary"] as? String
        if let iconString = resultJSONDict["icon"] as? String
        {
            icon = UIImage(named: iconString)
        }
    }
}


