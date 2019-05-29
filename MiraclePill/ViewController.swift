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
        showBuyAlertController()
    }
    
    // MARK: My functions
    private func setImageViewClick() {
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(onBuyNowClick))
        imageViewBuyNow.isUserInteractionEnabled = true
        imageViewBuyNow.addGestureRecognizer(singleTap)
    }
    
    // Create an UIAlertController containing a custom view
    func showBuyAlertController() {
        // Create the alert and custom view
        let alertController = UIAlertController(title: "Information", message: nil, preferredStyle: .alert)
        let customView = UIView()
        
        // Add custom view to alert container
        alertController.view.addSubview(customView)

        // Set the alert up
        alertController.view.translatesAutoresizingMaskIntoConstraints = false
        alertController.view.heightAnchor.constraint(equalToConstant: 380).isActive = true
        
        // Set the custom view up
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.topAnchor.constraint(equalTo: alertController.view.topAnchor, constant: 45).isActive = true
        customView.rightAnchor.constraint(equalTo: alertController.view.rightAnchor, constant: -10).isActive = true
        customView.leftAnchor.constraint(equalTo: alertController.view.leftAnchor, constant: 10).isActive = true
        customView.heightAnchor.constraint(equalToConstant: 250).isActive = true
//        customView.backgroundColor = .gray

        // Create button actions
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let buyAction = UIAlertAction(title: "Buy", style: .default) { (action) in
            self.buyMiraclePill()
        }
    
        // Add button actions
        alertController.addAction(cancelAction)
        alertController.addAction(buyAction)
        
        // Show the alert
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func buyMiraclePill() {
        print("Bought")
    }
}
