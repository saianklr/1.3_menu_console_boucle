//
//  Weapon.swift
//  App_Console
//
//  Created by Jimmy Valente on 07/06/2021.
//  Copyright © 2021 jvalente. All rights reserved.
//

import Foundation


class Weapon {
    init(name: String, power: Int = 1, precision: Double = 1.0) {
        self.name = name
        self.power = power
        self.precision = precision
    }
    
    
    var name : String
    var power : Int
    var precision : Double
    
    var description: String {
        "\nArme - \(name) : Puissance - \(power) - Précision - \(Int(precision * 100))%)"
    }
    

}





