//
//  PurchaseInformation.swift
//  MiraclePill
//
//  Created by Mateus on 02/06/19.
//  Copyright © 2019 Mateus. All rights reserved.
//

import Foundation

class PurchaseInformation {
    internal init(name: String, address: String, zipcode: String, city: String, state: String, country: String) {
        self.name = name
        self.address = address
        self.zipcode = zipcode
        self.city = city
        self.state = state
        self.country = country
    }
    
    var name: String
    var address: String
    var zipcode: String
    var city: String
    var state: String
    var country: String
}
