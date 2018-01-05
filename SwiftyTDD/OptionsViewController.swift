//
//  OptionsViewController.swift
//  SwiftyTDD
//
//  Created by William Thompson on 12/26/17.
//  Copyright © 2017 William Thompson. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController, UITextFieldDelegate {

    let myPrefs = Prefs();
    
    @IBOutlet weak var tokenField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadPrefs()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        savePrefs()
    }
    
    func savePrefs() {
        if let tokenOut = tokenField.text {
            myPrefs.tokenField = tokenOut
        }
        myPrefs.savePrefs()
    }
    
    func loadPrefs() {
        myPrefs.loadPrefs()
        tokenField.text = myPrefs.tokenField
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let tokenString = textField.text {
            print("Token that was inserted is \(tokenString)")
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
            textField.becomeFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let token = tokenField.text {
            if token.count == 16 {
                tokenField.textColor = UIColor.green
            } else {
                tokenField.textColor = UIColor.red
            }
        }
        return true
    }
}
