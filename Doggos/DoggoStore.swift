//
//  DoggoStore.swift
//  Doggos
//
//  Created by Kwiatkowski, Rafal on 02/09/2022.
//

import UIKit

class DoggoStore {
    private var unlockDictionary: [String: Bool] {
        get {
            UserDefaults.standard.dictionary(forKey: "unlock") as? [String: Bool] ?? [:]
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "unlock")
        }
    }
    
    private var raceGuessedDictionary: [String: Bool] {
        get {
            UserDefaults.standard.dictionary(forKey: "race") as? [String: Bool] ?? [:]
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "race")
        }
    }
    
    func doggos() -> [Doggo] {
        [
            .init(race: "jamnik", letterIndex: 0, image: UIImage(named: "jamnik"),
                  isUnlocked: unlockDictionary["jamnik"] == true,
                  isRaceGuessed: raceGuessedDictionary["jamnik"] == true,
                  qrCode: "1"),
            .init(race: "buldog", letterIndex: 1, image: UIImage(named: "buldog"),
                  isUnlocked: unlockDictionary["buldog"] == true,
                  isRaceGuessed: raceGuessedDictionary["buldog"] == true,
                  qrCode: "2")
        ]
    }
    
    func unlockDoggo(race: String) {
        unlockDictionary[race] = true
    }
}
