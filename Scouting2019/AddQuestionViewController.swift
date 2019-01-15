//
//  AddQuestionViewController.swift
//  Scouting2019
//
//  Created by Aidan Zerwer on 2019-01-10.
//  Copyright © 2019 4069. All rights reserved.
//

import UIKit

class AddQuestionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var questionPicker: UIPickerView!
    @IBOutlet weak var questionName: UITextField!
    
    let questionList = ["Large Text Box", "Slider", "Small Text Box", "Switch", "Stepper"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionPicker.delegate = self
        questionPicker.dataSource = self
    }
    
    // Picker View Functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return questionList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return questionList[row]
    }

    @IBAction func backToDesign(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "backToDesign", sender: self)
    }
}
