//
//  File.swift
//  App_Console
//
//  Created by Jimmy Valente on 02/05/2021.
//  Copyright © 2021 jvalente. All rights reserved.
//

import Foundation

class Math {
    static func nombreAleatoire(comprisEntre min:Int, et max:Int) ->Int {
        return Int(arc4random_uniform(UInt32(max + 1)) + UInt32(min))
    }
}

func lanceDes(playerName:String) -> Int {
    let resultDes:Int = Int.random(in: 1...6) + Int.random(in: 1...6)
    print("\(playerName) a lancé les dés et a obtenu \(resultDes)")
    return resultDes
}



