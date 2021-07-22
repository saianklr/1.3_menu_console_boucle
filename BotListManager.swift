//
//  BotListManager.swift
//  App_Console
//
//  Created by Jimmy Valente on 18/06/2021.
//  Copyright © 2021 mbritto. All rights reserved.
//

import Foundation

class BotListManager {
    let botList:[Bots] = [
        Bots(pseudo: "John le Troll", strenght: 1, health: 100),
        Bots(pseudo: "Bobby le toutou", strenght: 2, health: 100),
        Bots(pseudo: "Lola la Loutre", strenght: 3, health: 100),
        Bots(pseudo: "Boubouille", strenght: 4, health: 100),
        Bots(pseudo: "Jango le Persan Chinchilla Silver de Lantenay", strenght: 10, health: 200)
    ]
    private var nextBotIndex = 0
    
    func getNextBot() -> Bots? {
    guard nextBotIndex < botList.count else {return nil}
        
        let nextBot = botList[nextBotIndex]
        nextBotIndex += 1
        return nextBot

        
    }
}
