//
//  WeaponListManager.swift
//  App_Console
//
//  Created by Jimmy Valente on 09/06/2021.
//  Copyright © 2021 jvalente. All rights reserved.
//

import Foundation


class weaponListManager {
    
    var weaponList : [Weapon] = [
        Weapon(name: "Epée Standard", power: 1, precision: 1),
        Weapon(name: "Hâche" , power: 3, precision: 0.5),
        Weapon(name: "Excalibur" , power: 5, precision: 0.2)
    ]
    
    var nextWeaponIndex = 0
    
    func getNextWeaponToLoot() -> Weapon? {
        
        guard nextWeaponIndex < weaponList.count  else {
            return nil }
        
        let nextWeapon = weaponList[nextWeaponIndex]
        
        nextWeaponIndex += 1
        
        
        return nextWeapon
    }
    
    
}


