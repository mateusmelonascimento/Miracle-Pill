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
        if let data = validateFields() {
            showBuyAlertController(purchaseInformation: data)
        }
    }
    
    // MARK: My functions
    private func setImageViewClick() {
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(onBuyNowClick))
        imageViewBuyNow.isUserInteractionEnabled = true
        imageViewBuyNow.addGestureRecognizer(singleTap)
    }
    
    func showBuyAlertController(purchaseInformation: PurchaseInformation) {
        // Create the alert
        let alertController = UIAlertController(title: "Information", message: nil, preferredStyle: .alert)
        
        // Create my custom views
        let name = UILabel(frame: CGRect(x:0, y: 0, width: 250, height: 50))
        let address = UILabel(frame: CGRect(x:0, y: 0, width: 250, height: 50))
        let zipCode = UILabel(frame: CGRect(x:0, y: 0, width: 250, height: 50))
        let city = UILabel(frame: CGRect(x:0, y: 0, width: 250, height: 50))
        let state = UILabel(frame: CGRect(x:0, y: 0, width: 250, height: 50))
        let country = UILabel(frame: CGRect(x:0, y: 0, width: 250, height: 50))
        
        // Add custom views to alert container
        alertController.view.addSubview(name)
        alertController.view.addSubview(address)
        alertController.view.addSubview(zipCode)
        alertController.view.addSubview(city)
        alertController.view.addSubview(state)
        alertController.view.addSubview(country)
        
        // Set the alert up
        alertController.view.translatesAutoresizingMaskIntoConstraints = false
        alertController.view.heightAnchor.constraint(equalToConstant: 240).isActive = true
        alertController.view.widthAnchor.constraint(equalToConstant: 280).isActive = true
        
        // Set the custom view name up
        name.adjustsFontSizeToFitWidth = false
        name.lineBreakMode = .byTruncatingMiddle
        name.textAlignment = .left
        name.textColor = .white
        name.font = UIFont(name: "Avenir-Light", size: 15.0)
        name.text = "Name:  \(purchaseInformation.name)"
        name.translatesAutoresizingMaskIntoConstraints = false
        name.topAnchor.constraint(equalTo: alertController.view.topAnchor, constant: 45).isActive = true
        name.rightAnchor.constraint(equalTo: alertController.view.rightAnchor, constant: -10).isActive = true
        name.leftAnchor.constraint(equalTo: alertController.view.leftAnchor, constant: 10).isActive = true
        name.backgroundColor = .lightGray
        
        // Set the custom view address up
        address.textAlignment = .left
        address.textColor = .white
        address.font = UIFont(name: "Avenir-Light", size: 15.0)
        address.text = "Address:  \(purchaseInformation.address)"
        address.translatesAutoresizingMaskIntoConstraints = false
        address.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5).isActive = true
        address.rightAnchor.constraint(equalTo: alertController.view.rightAnchor, constant: -10).isActive = true
        address.leftAnchor.constraint(equalTo: alertController.view.leftAnchor, constant: 10).isActive = true
        address.backgroundColor = .lightGray
        
        // Set the custom view zipCode up
        zipCode.textAlignment = .left
        zipCode.textColor = .white
        zipCode.font = UIFont(name: "Avenir-Light", size: 15.0)
        zipCode.text = "Zipcode:  \(purchaseInformation.zipcode)"
        zipCode.translatesAutoresizingMaskIntoConstraints = false
        zipCode.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 5).isActive = true
        zipCode.rightAnchor.constraint(equalTo: alertController.view.rightAnchor, constant: -10).isActive = true
        zipCode.leftAnchor.constraint(equalTo: alertController.view.leftAnchor, constant: 10).isActive = true
        zipCode.backgroundColor = .lightGray

        // Set the custom view city up
        city.textAlignment = .left
        city.textColor = .white
        city.font = UIFont(name: "Avenir-Light", size: 15.0)
        city.text = "City:  \(purchaseInformation.city)"
        city.translatesAutoresizingMaskIntoConstraints = false
        city.topAnchor.constraint(equalTo: zipCode.bottomAnchor, constant: 5).isActive = true
        city.rightAnchor.constraint(equalTo: alertController.view.rightAnchor, constant: -10).isActive = true
        city.leftAnchor.constraint(equalTo: alertController.view.leftAnchor, constant: 10).isActive = true
        city.backgroundColor = .lightGray

        // Set the custom view state up
        state.textAlignment = .left
        state.textColor = .white
        state.font = UIFont(name: "Avenir-Light", size: 15.0)
        state.text = "State:  \(purchaseInformation.state)"
        state.translatesAutoresizingMaskIntoConstraints = false
        state.topAnchor.constraint(equalTo: city.bottomAnchor, constant: 5).isActive = true
        state.rightAnchor.constraint(equalTo: alertController.view.rightAnchor, constant: -10).isActive = true
        state.leftAnchor.constraint(equalTo: alertController.view.leftAnchor, constant: 10).isActive = true
        state.backgroundColor = .lightGray

        // Set the custom view country up
        country.textAlignment = .left
        country.textColor = .white
        country.font = UIFont(name: "Avenir-Light", size: 15.0)
        country.text = "Address:  \(purchaseInformation.country)"
        country.translatesAutoresizingMaskIntoConstraints = false
        country.topAnchor.constraint(equalTo: state.bottomAnchor, constant: 5).isActive = true
        country.rightAnchor.constraint(equalTo: alertController.view.rightAnchor, constant: -10).isActive = true
        country.leftAnchor.constraint(equalTo: alertController.view.leftAnchor, constant: 10).isActive = true
        country.backgroundColor = .lightGray
        
        // Create button actions
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let buyAction = UIAlertAction(title: "Buy", style: .default) { (action) in
            self.performNetworkOperation(purchaseInformation: purchaseInformation)
        }
        
        // Add button actions
        alertController.addAction(cancelAction)
        alertController.addAction(buyAction)
        
        // Show the alert
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func createSpinnerView() {
        let child = SpinnerViewController()
        
        // Add the spinner view controller
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
        
        // Wait two seconds to simulate some work happening
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // Then remove the spinner view controller
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
            
            // Show action completed
            self.showUIAlert(alertTitlte: "Congratulations", alertMessage: "You have just bought the miracle pills.", buttonTitle: "Ok")
        }
    }
    
    private func showUIAlert(alertTitlte: String, alertMessage: String, buttonTitle: String) {
        let alert = UIAlertController(title: alertTitlte, message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func validateFields() -> PurchaseInformation? {
        do {
            let name = try textFieldName.validatedText(validationType: ValidatorType.name)
            let address = try textFieldAddress.validatedText(validationType: ValidatorType.address)
            let zipcode = try self.textFieldZipCode.validatedText(validationType: ValidatorType.zipcode)
            let city = try textFieldCity.validatedText(validationType: ValidatorType.city)
            let state = try textFieldState.validatedText(validationType: ValidatorType.state)
            let country = try self.textFieldCountry.validatedText(validationType: ValidatorType.country)
            
            // Create Data class in order to encapsulate the information you want and perform network operation
            return PurchaseInformation(name: name, address: address, zipcode: zipcode, city: city, state: state, country: country)
        } catch(let error) {
            // Show alert. Fields mandatory
            showUIAlert(alertTitlte: "Empty field", alertMessage: (error as! ValidationError).message, buttonTitle: "Ok")
            return nil
        }
    }
    
    private func performNetworkOperation(purchaseInformation: PurchaseInformation) {
        // Pretend to perform network operation, like buying the miracle pills
        createSpinnerView()
    }
}


//************************ CODE FOR HANDLING VALIDATION ON TEXFLIEDS ************************

// Add func to TextField in order to reduce multiple calls when coding
extension UITextField {
    func validatedText(validationType: ValidatorType) throws -> String {
        let validator = VaildatorFactory.validatorFor(type: validationType)
        return try validator.validated(self.text!)
    }
}

protocol ValidatorConvertible {
    func validated(_ value: String?) throws -> String
}

enum ValidatorType {
    case name
    case address
    case zipcode
    case city
    case state
    case country
}

// Each case represents one type of validtion. You should add case when creating another field in the code
enum VaildatorFactory {
    static func validatorFor(type: ValidatorType) -> ValidatorConvertible {
        switch type {
        case .name: return EmptyStringValidator()
        case .address: return EmptyStringValidator()
        case .zipcode: return EmptyStringValidator()
        case .city: return EmptyStringValidator()
        case .state: return EmptyStringValidator()
        case .country: return EmptyStringValidator()
        }
    }
}

struct ValidationError: Error {
    var message: String
    
    init(_ message: String) {
        self.message = message
    }
}

// Here I should create validators for all types, but I just want to create for empty texfields one
struct EmptyStringValidator: ValidatorConvertible {
    func validated(_ value: String?) throws -> String {
        if (value!.isEmpty) {
            throw ValidationError("Please, fill in all fields.")
        } else {
            return value!
        }
    }
}
