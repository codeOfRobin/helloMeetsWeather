//
//  NetworkRequestManager.swift
//  helloMeetsWeather
//
//  Created by Robin Malhotra on 24/03/16.
//  Copyright © 2016 Robin Malhotra. All rights reserved.
//

import UIKit

class NetworkRequestManager: NSObject
{
    typealias JSONDictionaryCompletion = ([String: AnyObject]? -> Void)
    func downloadFromURL(url:String, completion: JSONDictionaryCompletion)
    {
        let session = NSURLSession.sharedSession()
        guard let forecastURL = NSURL(string: url) else
        { return }
    
        let task = session.dataTaskWithURL(forecastURL) { (let data, let response, let error) in
            guard let httpResponse = response as? NSHTTPURLResponse else
            {print("no valid http response formed")
            return}
            
            if httpResponse.statusCode == 200
            {
                let jsonDict = (try? NSJSONSerialization.JSONObjectWithData(data!, options: [])) as? [String: AnyObject]
                completion(jsonDict)
            }
            
            else
            {
                print("Error status code: \(httpResponse.statusCode)")
            }
        
        }
        task.resume()
    }
}
