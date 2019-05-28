//
//  ViewController.swift
//  MiraclePill
//
//  Created by Mateus on 21/05/19.
//  Copyright © 2019 Mateus. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Outlets reference
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldAddress: UITextField!
    @IBOutlet weak var textFieldZipCode: UITextField!
    @IBOutlet weak var textFieldCity: UITextField!
    @IBOutlet weak var textFieldState: UITextField!
    @IBOutlet weak var textFieldCountry: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set delegate to textFields
        textFieldName.delegate = self
        textFieldAddress.delegate = self
        textFieldZipCode.delegate = self
        textFieldCity.delegate = self
        textFieldState.delegate = self
        textFieldCountry.delegate = self
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
            case textFieldName:
                textFieldAddress.becomeFirstResponder()
            case textFieldAddress:
                textFieldZipCode.becomeFirstResponder()
            case textFieldZipCode:
                textFieldCity.becomeFirstResponder()
            case textFieldCity:
                textFieldState.becomeFirstResponder()
            case textFieldState:
                textFieldCountry.becomeFirstResponder()
            default:
                textField.resignFirstResponder()
        }
        return false
    }
}
