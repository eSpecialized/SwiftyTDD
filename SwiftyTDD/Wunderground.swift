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
    
    
    func getTemp(completion: (_ temp: String) -> Void) {
        completion("")
    }
}
