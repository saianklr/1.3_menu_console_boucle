//  Created by Jimmy Valente on 02/05/2021.
//  Copyright © 2021 jvalente. All rights reserved.


import Foundation



//fonction de jeu principal
func fonctionPrincipale() {
    
    
    //déclaration de joueur1
    
    print("Veuillez rentrer votre nom : ")
    let j1 = Joueur()
    j1.pseudo = Utilisateur.saisirTexte()
    j1.strenght = 1.5
    j1.health = 100
    
    let arme = j1.arme
    
    
    
    //menu principal
    print("Enchanté \(j1.pseudo)")
    print()
    print("*****************************")
    print("   Bienvenue dans notre jeu")
    print("*****************************")
    print()
    print("Voici vos statistiques")
    
    //affiche les stat joueur et adversaire
    
    voirJoueur(player: j1)
    
    
    
    //déclaration du ou des Bot(s)
    
    //permet d'améliorer la force du bot en fonction du niveau, si au début il prendra le 1 qui est le minimum, sinon il prendra la force joueur - 1 pour etre toujours un peu plus fort que lui
    
    
    
    var newMonster = Bots.getNextBot()
    var monster : Bots = newMonster!

    
    var botCount = 0
    
    
    
    while j1.isAlive {
        
        
        
        
        monster.strenght = 1
        monster.health = 100
        
        print("\n!!!!ATTENTION!!!! \nUn nouveau Monstre approche, et il a une force de : \(monster.strenght)")
        
        
        
        if botCount > 0 {
            
            print("Votre santé actuelle est de : \(j1.health)")
        }
        
        var counter = 0
        print()
        voirMonster(bot: monster)
        
        
        while monster.health > 0 && j1.health > 0  {
            
            print()
            
            
            print("Prêt à affronter le Monstre?")
            print()
            
            print("\(j1.pseudo), appuyez sur entrée pour continuer... Qui sera le prochain à attaquer??")
            _ = Utilisateur.saisirTexte()
            
            //permet de tirer au sort qui commence le tour
            let aQuiLeTour = Bool.random()
            
            
            
            print("--------------------------------------------")
            print("")
            print("")
            print("")
            
            
            
            
            if aQuiLeTour == true {
                
                print("C'est votre tour ...")
                
                j1.attack(bot: monster)
                print("")
                print("")
                print("")
                
                
                //affiche le numéro du tour
                counter += 1
                print("Tour numéro \(counter)")
                print("")
                print("--------------------------------------------")
                print("")
                print("")
                
                
                
            } else {
                
                if monster.health > 0 {
                    
                    print("C'est au tour du Monstre ... ")
                    
                    
                    let resultDesBot = botAttack()
                    j1.health = j1.health - resultDesBot
                    print("\(monster.pseudo) VOUS assène un coup avec une force de \(resultDesBot)")
                    print("OUTCH ! Votre santé est de \(j1.health)%")
                    
                    print("")
                    print("")
                    print("")
                    print("")
                    
                    
                    //affiche le numéro du tour
                    counter += 1
                    print("Tour numéro \(counter)")
                    print()
                    print("--------------------------------------------")
                    print("")
                    print("")
                    
                    
                }
                
                
            }
            
        }
        
        
        if j1.isAlive {
            
            print()
            print()
            print("*****************************")
            print("\nLe Monstre est battu, BRAVO \nYou are the WINNER !!")
            j1.didWin(against: monster)
            print("*****************************")
            print("Votre force a augmentée ! Elle est maintenant de \(j1.strenght)")
            print("*****************************")
            botCount += 1
            print()
            print()
            j1.raiseHealth(factor: 1.7)
            print("")
            print("")
            print("")
            print("")
            
            
            
        }
        
        else {
            print("*****************************")
            print("\nVous êtes morts, le Monstre vous a terrassé \nYou are a LOSER BRO!!!")
            print("Vous avez battu \(botCount) monstres")
            print("*****************************")
            
        }
        
    }
    
    
    func lanceDes(playerName:String) -> Int {
        let resultDes:Int = Int.random(in: 1...6) + Int.random(in: 1...6)
        print("\(playerName) a lancé les dés et a obtenu \(resultDes)")
        return resultDes
    }
    
    func botAttack() -> Int {
        let resultDesBot:Int = Int.random(in: 1...6) + Int.random(in: 1...6)
        print("Le Monstre a lancé les dés et a obtenu \(resultDesBot)")
        return resultDesBot
    }
    
    func voirJoueur(player : Joueur) {
        print("Nom - \(player.pseudo) \nSanté - \(player.health) \nForce - \(player.strenght), \(arme.description)")
    }
    
    func voirMonster(bot : Bots) {
        print("Voici votre adversaire \nNom - \(bot.pseudo) \nSanté - \(bot.health) \nForce - \(bot.strenght)")
    }
    
}

fonctionPrincipale()

