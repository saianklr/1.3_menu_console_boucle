//
//  BotListManager.swift
//  App_Console
//
//  Created by Jimmy Valente on 10/06/2021.
//  Copyright © 2021 jvalente. All rights reserved.
//

import Foundation



class BotListManager {
    
    var botList : [Bots] = [
        Bots(pseudo: "Johnny le Troll", strenght: 1.0, health: 100.0),
        Bots(pseudo: "Jeannot le Dragon", strenght : 2.0, health : 100.0),
        Bots(pseudo: "Jango le Persan Chinchilla", strenght : 5.0, health : 100.0)
    ]
    
    
    var nextBotIndex = 0
    
    
    //fonction pour passer au nouveau Bot
    func goToNextBot() -> Bots? {
        
        guard nextBotIndex < botList.count  else {
            return nil }
        
        let nextBot = botList[nextBotIndex]
        
        nextBotIndex += 1
        
        
        return nextBot
        
    }
    
    
}

