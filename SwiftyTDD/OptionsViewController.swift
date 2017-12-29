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
    
    @IBOutlet weak var noaaTokenField: UITextField!
    
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
        if let tokenOut = noaaTokenField.text {
            myPrefs.tokenField = tokenOut
        }
        myPrefs.savePrefs()
    }
    
    func loadPrefs() {
        myPrefs.loadPrefs()
        noaaTokenField.text = myPrefs.tokenField
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
}
