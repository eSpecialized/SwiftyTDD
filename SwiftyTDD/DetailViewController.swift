//
//  DetailViewController.swift
//  SwiftyTDD
//
//  Created by William Thompson on 12/22/17.
//  Copyright © 2017 William Thompson. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var myStatus: UILabel!
    
    @IBOutlet weak var gasLabel: UILabel!
    
    @IBOutlet weak var theSlide: UISlider!
    
    deinit {
        print("DetailViewController released")
    }
    
    @IBAction func OnOffChanged(_ sender: Any) {
        if let mySwitch = sender as? UISwitch
        {
            if mySwitch.isOn {
                myStatus.text = "Switch is on"
            } else {
                myStatus.text = "Label"
            }
            
        }
    }
    
    @IBAction func changeGasClicked(_ sender: Any) {
        gasLabel.text = "Regular Gas"
    }
    
    @IBAction func showAlertClicked(_ sender: Any) {
        let alertMe = UIAlertController(title: "Handy Alert", message: "Change status?", preferredStyle: .alert)
        let meAction1 = UIAlertAction(title: "Okay!", style: .default) { [unowned self] (theAction) in
            self.detailDescriptionLabel.text = "Ok Boss"
        }
        alertMe.addAction(meAction1)
        
        present(alertMe, animated: true, completion: nil)
        
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = "\(detail.city!), \(detail.state!)"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: Event? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
    func getRowData(_ row: Int) -> String
    {
        switch row {
        case 0:
            return "Portland"
            
        case 1:
            return "Springfield"
            
        case 2:
            return "Salem"
        default:
            return "No Where"
        }
        return ""
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return getRowData(row)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print( getRowData(row) )
    }
}

