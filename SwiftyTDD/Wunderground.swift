//
//  wunderground.swift
//  SwiftyTDD
//
//  Created by William Thompson on 12/28/17.
//  Copyright © 2017 William Thompson. All rights reserved.
//

import UIKit

class Wunderground: NSObject {

    var location = ""
    var state = ""
    var apikey = ""
    
    func getTemp(completion: @escaping (_ temp: String) -> Void) -> Bool {
        
        if apikey.isEmpty {
            let ud = UserDefaults.standard
            guard let token = ud.string(forKey: "token") else { return false }
            self.apikey = token
        }
        
        let urlString = "https://api.wunderground.com/api/" + apikey + "/conditions/q/\(self.state)/\(self.location).json"
        
        let urlReq = URLRequest(url: URL(string: urlString)!)
        let urlFetch = URLSession.shared
        
        let dataTask = urlFetch.dataTask(with: urlReq) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                do {
                    let jsonAny = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: Any]
                    print(jsonAny)
                    let current_observation = jsonAny["current_observation"] as! [String: Any]
                    
                    let tempF = current_observation["temp_f"] as! NSNumber
                    
                    print(tempF.stringValue)
                    completion(tempF.stringValue)
                    
                    
                } catch let errorJson {
                    print(errorJson)
                }
            }
        }
        
        dataTask.resume()

        return true
    }
}
