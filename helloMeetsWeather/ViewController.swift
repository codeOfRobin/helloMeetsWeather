//
//  ViewController.swift
//  helloMeetsWeather
//
//  Created by Robin Malhotra on 20/02/16.
//  Copyright © 2016 Robin Malhotra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        retrieveWeather()
    }
    
    
    func retrieveWeather()
    {
        let forecastService = ForecastService(key: "a23f7208a73339eb39f8b569a4ca5ca0")
        forecastService.getForecast { (let weatherData) in
            print(weatherData?.ozone)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

