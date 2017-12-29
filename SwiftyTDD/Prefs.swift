//
//  Prefs.swift
//  SwiftyTDD
//
//  Created by William Thompson on 12/26/17.
//  Copyright © 2017 William Thompson. All rights reserved.
//

import UIKit

class Prefs: NSObject {
    
    var tokenField = ""

    func savePrefs() {
        let ud = UserDefaults.standard
        ud.set(tokenField, forKey: "token")
        ud.synchronize()
    }
    
    func loadPrefs() {
        let ud = UserDefaults.standard
        if let tokenOut = ud.string(forKey: "token")
        {
            tokenField = tokenOut
        }
    }
    
}
