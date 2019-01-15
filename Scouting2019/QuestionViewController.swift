//
//  QuestionViewController.swift
//  Scouting2019
//
//  Created by Aidan Zerwer on 2019-01-10.
//  Copyright © 2019 4069. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Design Questions screen back button
    @IBAction func changeToMain(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "toMainSegue", sender: self)
    }
    
    // Design Questions screen save button
    @IBAction func saveDesign(_ sender: UIBarButtonItem) {
    }
    
    // Design Questions screen add button
    @IBAction func addElement(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "toQuestionSelector", sender: self)
    }
}

class questionTableView: UITableView {
    var tmp = ["One", "Two", "Three"]

    override func numberOfRows(inSection section: Int) -> Int {
        return tmp.count
    }
    
    override var numberOfSections: Int {
        return 1
    }
    
}
