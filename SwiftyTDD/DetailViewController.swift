//
//  DetailViewController.swift
//  SwiftyTDD
//
//  Created by William Thompson on 12/22/17.
//  Copyright © 2017 William Thompson. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var myStatus: UILabel!
    
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
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.timestamp!.description
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


}

