//
//  WeaponListManager.swift
//  App_Console
//
//  Created by Jimmy Valente on 18/06/2021.
//  Copyright © 2021 mbritto. All rights reserved.
//

import Foundation

class WeaponListManager {
    private let weaponList:[Weapon] = [
        Weapon(name: "Epée Standard", precision: 1, power: 2),
        Weapon(name: "Hâche de Vicking", precision: 0.50, power: 4),
        Weapon(name: "Marteau", precision: 0.70, power: 3),
        Weapon(name: "Banane", precision: 1, power: 1),
        Weapon(name: "Excalibur", precision: 0.9, power: 8)
    ]
    private var nextWeaponIndex = 0
    
    func getNextWeaponToLoot() -> Weapon? {
        guard nextWeaponIndex < weaponList.count else { return nil }
        
        let nextWeapon = weaponList[nextWeaponIndex]
        nextWeaponIndex += 1
        return nextWeapon
    }
}
