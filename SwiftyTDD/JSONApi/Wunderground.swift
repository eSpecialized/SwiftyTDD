//
//  wunderground.swift
//  SwiftyTDD
//
//  Created by William Thompson on 12/28/17.
//  Copyright © 2017 William Thompson. All rights reserved.
//

import UIKit

class Wunderground: NSObject {

    enum WundergroundError: Error {
        case missingToken
        case invalidToken
    }
    
    fileprivate var _location : String
    var location : String {
        set {
            if let tempVal = newValue.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlPathAllowed)
            {
                _location = tempVal
            }
        }
        get {
            return _location
        }
    }
    var state = ""
    var apikey = ""
    
    override init() {
        _location = ""
        super.init()
    }
    
    func getTemp(completion: @escaping (_ temp: String) -> Void) throws -> Bool  {
        
        if apikey.isEmpty {
            let ud = UserDefaults.standard
            guard let token = ud.string(forKey: "token") else
            {
                throw WundergroundError.missingToken
            }
            
            if token.count != 16
            {
                throw WundergroundError.invalidToken
            }
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
