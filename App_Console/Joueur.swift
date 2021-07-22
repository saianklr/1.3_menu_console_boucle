//
//  Player.swift
//  App_Console
//
//  Created by Jimmy Valente on 02/05/2021.
//  Copyright © 2021 jvalente. All rights reserved.
//

import Foundation


class Joueur {
    private var _pseudo: String = ""
    private var _strenght: Float = 0
    private var _health: Int = 0
    private let weaponListManager = WeaponListManager()
    
    
    var arme = Weapon(name: "Epée Standard")
    
    
    var pseudo: String {
        get {_pseudo}
        set {
            _pseudo = newValue
        }
    }
    
    var strenght: Float {
        get {_strenght}
        set {
            _strenght = newValue
        }
    }
    
    var health: Int {
        get {_health}
        set {
            _health = newValue
        }
    }
    
    
    
    
    var isAlive: Bool { health > 0 }
    
    func viewPlayer() {
        print("Nom - \(pseudo) \nSanté - \(health) \nForce - \(strenght)")
        
    }
    
    //différents choix utilisateur pour l'attaque ou le repos
    func attack(bot : Bots) {
        var userChoice : Int
        
        repeat {
            print("1 - Attaque : Arme actuelle : \(arme.name)")
            print("2 - Attaque Magique (plus forte mais moins de chance de réussite)")
            print("3 - Se reposer (passe son tour mais recupère de la santé)")
            print("Tapez votre Choix :")
            userChoice = Utilisateur.saisirEntier()
            print("")
            if userChoice<1 || userChoice>3 {
                print("")
                print("Choix impossible !! Veuillez réessayer ...")
                print("")
            }
        }while userChoice<1 || userChoice>3
        
        
        //choix numéro 1 avec arme standard
        if userChoice == 1 {
            
            // lance les dés et ATTAQUE NORMALE
            print("")
            print("")
            let resultDes = lanceDes(playerName: self.pseudo)
            
            //if permettant d'avoir un pourcentage (double entre 0.0 et 1.0) de réussite, précision
            if Double.random(in: 0.0...1.0) <= arme.precision {
                bot.health = bot.health - Float(resultDes) * (_strenght * Float(arme.power))
                print("\(self.pseudo) assène un coup sur le Monstre avec une force de \(Float(resultDes) * (_strenght * Float(arme.power)))")
                print("La santé du Monstre est de \(bot.health)%")
                print()
            } else {
                print("Vous avez raté votre coup ...")
                
            }
            
            //choix numéro deux avec attaque magique et risque de non reussite accru
            
        } else if userChoice == 2 {
            
            //lance les dés et ATTAQUE MAGIQUE
            print("")
            print("")
            let hasard:Int = Int.random(in: 1...10)
            
            if hasard < 4 {
                print("")
                print("Votre attaque à échoué !!!! ")
                print("")
                
                
            } else {
                
                
                let resultDes = lanceDes(playerName: self.pseudo)
                bot.health = bot.health - Float((resultDes + 5))
                print("\(self.pseudo) lance une MAGIE sur le Monstre avec une force impressionante de \(resultDes+5) !! ")
                print("La santé du Monstre est de \(bot.health)%")
                print()
            }
            
            
        }else {
            raiseHealth(factor: 1.7)
            print("")
            print("Vous vous reposez.... votre santé est maintenant de \(self.health)")
            print("")
        }
        //SE REPOSE
    }
    
    func rest() {
        raiseHealth(factor: 1.7)
    }
    
    //Augmente la force si l'on a gagné et change arme
    func didWin(against bot : Bots) {
        self.strenght = self.strenght + bot.strenght
        raiseHealth(factor: 1.4)
        
        var userChoice : Int
        
        // permet d'aller chercher dans le tableau d'armes une nouvelle arme
        if let nouvelleArme = weaponListManager.getNextWeaponToLoot() {
        
        repeat {
            
            print("Le Monstre a fait tomber son arme : \(nouvelleArme.description) ")
            print("Souhaitez vous la ramasser?")
            print("1 - Ramasser l'arme")
            print("2 - Conserver l'arme actuelle")
            userChoice = Utilisateur.saisirEntier()
            
            if userChoice<1 || userChoice>3 {
                print("")
                print("Choix impossible !! Veuillez réessayer ...")
                print("")
            }
        }while userChoice<1 || userChoice>2
        
        if userChoice == 1 {
            self.arme = nouvelleArme
            print("Nouvelle arme selectionnée")
        } else{
            print("Arme actuelle conservée")
        }
    }
    

    }




//Augmente la santé
func raiseHealth (factor : Double){
    guard factor > 1 else {
        return
    }
    let newHealth = Int(Double(self.health) * factor)
    self.health = min(newHealth, 100)
    
    
}

func botAttack() -> Int {
    let resultDesBot:Int = Int.random(in: 1...6) + Int.random(in: 1...6)
    print("Le Monstre a lancé les dés et a obtenu \(resultDesBot)")
    return resultDesBot
}

func voirJoueur(player : Joueur) {
    print("Nom - \(player.pseudo) \nSanté - \(player.health) \nForce - \(player.strenght)")
}

func voirMonster(bot : Bots) {
    print("Voici votre adversaire \nNom - Monster \nSanté - \(bot.health) \nForce - \(bot.strenght)")
}

}



