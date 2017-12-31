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
                    let jsondecode = JSONDecoder()
                    
                    let o = try jsondecode.decode(currently.self, from: data)
                    
                    completion(o.current_observation.feelslike_f)
                    
                } catch let errorJson {
                    print(errorJson)
                }
            }
        }
        
        dataTask.resume()

        return true
    }
}
