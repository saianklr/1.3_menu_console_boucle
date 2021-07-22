//
//  Bots.swift
//  App_Console
//
//  Created by Jimmy Valente on 02/05/2021.
//  Copyright © 2021 jvalente. All rights reserved.
//

import Foundation


class Bots : BotListManager {
    
    init(pseudo: String, strenght: Float = 1.0, health: Float = 100.0) {
        self.pseudo = pseudo
        self.strenght = strenght
        self.health = health
    }
    
    
    var pseudo: String
    var strenght:Float
    var health:Float
    
    var isAlive: Bool { health > 0 }
    
    func ViewBot(){
        print("Voici votre adversaire \nNom - \(pseudo) \nSanté - \(health) \nForce - \(strenght)")
    }
    
    func didWin(against player : Joueur) {
        self.strenght = self.strenght + player.strenght
    }
    
    

    
    
    
    
}
