//
//  QuestionTypes.swift
//  Scouting2019
//
//  Created by Aidan Zerwer on 2019-01-14.
//  Copyright © 2019 4069. All rights reserved.
//
import UIKit

class UIQuestionSwitch: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
           
    lazy var textField: UITextField! = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.borderStyle = .roundedRect
        return view
    }()
}
