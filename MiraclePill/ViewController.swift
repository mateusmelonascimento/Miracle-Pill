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
    @IBOutlet weak var imageViewBuyNow: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set delegate to textFields
        textFieldName.delegate = self
        textFieldAddress.delegate = self
        textFieldZipCode.delegate = self
        textFieldCity.delegate = self
        textFieldState.delegate = self
        textFieldCountry.delegate = self
        
        
        // Add image view
        setImageViewClick()
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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        animateViewMoving(up: true, moveValue: 100)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        animateViewMoving(up: false, moveValue: 100)
    }
    
    // Lifting the view up
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:TimeInterval = 0.3
        let movement:CGFloat = (up ? -moveValue : moveValue)
       
        UIView.beginAnimations("animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    // MARK: Actions
    @objc func onBuyNowClick() {
        let alert = UIAlertController(title: "Did you bring your towel?", message: "It's recommended you bring your towel before continuing.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
        print("Imageview Clicked")
    }
    
    // MARK: My functions
    private func setImageViewClick() {
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(onBuyNowClick))
        imageViewBuyNow.isUserInteractionEnabled = true
        imageViewBuyNow.addGestureRecognizer(singleTap)
    }
}
