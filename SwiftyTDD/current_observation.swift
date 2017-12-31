//
//  current_observation.swift
//  SwiftyTDD
//
//  Created by William Thompson on 12/28/17.
//  Copyright © 2017 William Thompson. All rights reserved.
//

import Foundation

public struct observlocation: Codable {
    public let city : String
    public let country : String
    public let elevation: String
    public let full : String
    public let latitude : String
    public let longitude : String
    public let state : String
}

public struct ImageStruct: Codable {
    public let link: String
    public let title: String
    public let url: URL
}

public struct ObservationsObj:  Codable {
    public let feelslike_f : String
    public let feelslike_c : String
    public let temp_c : Double
    public let temp_f : Double
    public let observation_location: observlocation
    public let relative_humidity : String
    public let image : ImageStruct
}

public struct currently: Codable {
    
    public let current_observation: ObservationsObj
    
}
