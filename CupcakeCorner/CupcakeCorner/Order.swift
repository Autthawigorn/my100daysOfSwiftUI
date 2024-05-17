//
//  Order.swift
//  CupcakeCorner
//
//  Created by Autthawigorn Yortpiboot on 15/5/2567 BE.
//

import Foundation

@Observable
class Order: Codable {
    enum CodingKeys: String, CodingKey {
        case _type = "type"
           case _quantity = "quantity"
           case _specialRequestEnabled = "specialRequestEnabled"
           case _extraFrosting = "extraFrosting"
           case _addSprinkles = "addSprinkles"
           case _name = "name"
           case _city = "city"
           case _streetAddress = "streetAddress"
           case _zip = "zip"
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
        
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasvalidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        return true
    }
    
    var cost: Decimal {
        // $2 per cake
        var cost = Decimal(quantity) * 2
        
        // complicated cakes cost more
        cost += Decimal(type) / 2
        
        // $1 per cake for extra frosting
        if extraFrosting {
            cost += Decimal(quantity)
        }
        
        // $.50/cake for sprinkles
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }
        
        return cost
    }
}



/*
 1. Static Context: The types array is not dependent on any instance of the Order class. It's a property of the class itself. Therefore, it makes sense to declare it as a static property.
 
 2. Constants: The types array seems to represent the different types of orders available. Since these types don't change for individual instances of the Order class, it's appropriate to define them as a constant (let).
 
 **3. Shared Data: By using static, the types array is shared across all instances of the Order class. This means all instances of Order can access this array without needing to create their own copy, which can be efficient in terms of memory usage.
 */
