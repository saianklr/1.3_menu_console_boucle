//
//  Weapon.swift
//  App_Console
//
//  Created by Jimmy Valente on 18/06/2021.
//  Copyright © 2021 mbritto. All rights reserved.
//

import Foundation

class Weapon {
    var name : String
    var precision : Double
    let power : Int

    
    init(name : String, precision : Double = 1.0, power : Int = 1) {
        self.name = name
        self.precision = precision
        self.power = power
    }
    
    
    var description: String {
        "\(name) - Puissance:\(power) - Précision:\(Int(precision*100))%"
    }

}
