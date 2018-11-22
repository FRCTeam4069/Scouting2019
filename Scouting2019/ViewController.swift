//
//  ViewController.swift
//  Scouting2019
//
//  Created by Aidan Zerwer on 2018-11-21.
//  Copyright © 2018 4069. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var elementTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func changeToDesign(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "toDesignSegue", sender: self)
    }
    
    @IBAction func changeToMain(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "toMainSegue", sender: self)
    }
    
    @IBAction func saveDesign(_ sender: UIBarButtonItem) {
    }
}

