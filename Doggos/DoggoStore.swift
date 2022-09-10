//
//  DoggoStore.swift
//  Doggos
//
//  Created by Kwiatkowski, Rafal on 02/09/2022.
//

import UIKit

class DoggoStore {
    
    static let PASSWORD = "BEZA I HAKER"
    static let BORDER = "BORDER"
    static let GOLDEN = "GOLDEN"
    static let CORGI = "CORGI"
    static let JAMNIK = "JAMNIK"
    static let OWCZAREK_NIEMIECKI = "OWCZAREK NIEMIECKI"
    static let CHART = "CHART"
    static let PUDEL = "PUDEL"
    static let SAMOYED = "SAMOYED"
    static let HUSKY = "HUSKY"
    static let AKITA = "AKITA"
    static let DALMATYNCZYK = "DALMATYNCZYK"
    static let OWCZAREK_AUSTRALIJSKI = "OWCZAREK AUSTRALIJSKI"
    
    static let PINK_BORDER_UI_COLOR = UIColor(named: "pink_border") ?? <#default value#>
    static let GREEN_BACKGROUND_UI_COLOR = UIColor(named: "green_background") ?? <#default value#>

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
            .init(
                    race: DoggoStore.BORDER,
                    letterIndex: 0,
                    image: UIImage(named: DoggoStore.BORDER.lowercased()),
                    isUnlocked: unlockDictionary[DoggoStore.BORDER] == true,
                    isRaceGuessed: raceGuessedDictionary[DoggoStore.BORDER] == true,
                    qrCode: "sy(1)",
                    borderColor: DoggoStore.PINK_BORDER_UI_COLOR
            ),
            .init(
                    race: DoggoStore.GOLDEN,
                    letterIndex: 1,
                    image: UIImage(named: DoggoStore.GOLDEN.lowercased()),
                    isUnlocked: unlockDictionary[DoggoStore.GOLDEN] == true,
                    isRaceGuessed: raceGuessedDictionary[DoggoStore.GOLDEN] == true,
                    qrCode: "4s(2)",
                    borderColor: DoggoStore.GREEN_BACKGROUND_UI_COLOR
            ),
            .init(
                    race: DoggoStore.CORGI,
                    letterIndex: 2,
                    image: UIImage(named: DoggoStore.CORGI.lowercased()),
                    isUnlocked: unlockDictionary[DoggoStore.CORGI] == true,
                    isRaceGuessed: raceGuessedDictionary[DoggoStore.CORGI] == true,
                    qrCode: "l_(3)",
                    borderColor: DoggoStore.GREEN_BACKGROUND_UI_COLOR
            ),
            .init(
                    race: DoggoStore.JAMNIK,
                    letterIndex: 3,
                    image: UIImage(named: DoggoStore.JAMNIK.lowercased()),
                    isUnlocked: unlockDictionary[DoggoStore.JAMNIK] == true,
                    isRaceGuessed: raceGuessedDictionary[DoggoStore.JAMNIK] == true,
                    qrCode: "cv(4)",
                    borderColor: DoggoStore.PINK_BORDER_UI_COLOR
            ),
            .init(
                    race: DoggoStore.OWCZAREK_NIEMIECKI,
                    letterIndex: 4,
                    image: UIImage(named: DoggoStore.OWCZAREK_NIEMIECKI.lowercased()),
                    isUnlocked: unlockDictionary[DoggoStore.OWCZAREK_NIEMIECKI] == true,
                    isRaceGuessed: raceGuessedDictionary[DoggoStore.OWCZAREK_NIEMIECKI] == true,
                    qrCode: "3f(5)",
                    borderColor: DoggoStore.GREEN_BACKGROUND_UI_COLOR
            ),
            .init(
                    race: DoggoStore.CHART,
                    letterIndex: 5,
                    image: UIImage(named: DoggoStore.CHART.lowercased()),
                    isUnlocked: unlockDictionary[DoggoStore.CHART] == true,
                    isRaceGuessed: raceGuessedDictionary[DoggoStore.CHART] == true,
                    qrCode: "xy(6)",
                    borderColor: DoggoStore.GREEN_BACKGROUND_UI_COLOR
            ),
            .init(
                    race: DoggoStore.PUDEL,
                    letterIndex: 6,
                    image: UIImage(named: DoggoStore.PUDEL.lowercased()),
                    isUnlocked: unlockDictionary[DoggoStore.PUDEL] == true,
                    isRaceGuessed: raceGuessedDictionary[DoggoStore.PUDEL] == true,
                    qrCode: "_f(7)",
                    borderColor: DoggoStore.PINK_BORDER_UI_COLOR
            ),
            .init(
                    race: DoggoStore.SAMOYED,
                    letterIndex: 7,
                    image: UIImage(named: DoggoStore.SAMOYED.lowercased()),
                    isUnlocked: unlockDictionary[DoggoStore.SAMOYED] == true,
                    isRaceGuessed: raceGuessedDictionary[DoggoStore.SAMOYED] == true,
                    qrCode: "0z(8)",
                    borderColor: DoggoStore.PINK_BORDER_UI_COLOR
            ),
            .init(
                    race: DoggoStore.HUSKY,
                    letterIndex: 8,
                    image: UIImage(named: DoggoStore.HUSKY.lowercased()),
                    isUnlocked: unlockDictionary[DoggoStore.HUSKY] == true,
                    isRaceGuessed: raceGuessedDictionary[DoggoStore.HUSKY] == true,
                    qrCode: "_q(9)",
                    borderColor: DoggoStore.GREEN_BACKGROUND_UI_COLOR
            ),
            .init(
                    race: DoggoStore.AKITA,
                    letterIndex: 9,
                    image: UIImage(named: DoggoStore.AKITA.lowercased()),
                    isUnlocked: unlockDictionary[DoggoStore.AKITA] == true,
                    isRaceGuessed: raceGuessedDictionary[DoggoStore.AKITA] == true,
                    qrCode: "r_(10)",
                    borderColor: DoggoStore.PINK_BORDER_UI_COLOR
            ),
            .init(
                    race: DoggoStore.DALMATYNCZYK,
                    letterIndex: 10,
                    image: UIImage(named: DoggoStore.DALMATYNCZYK.lowercased()),
                    isUnlocked: unlockDictionary[DoggoStore.DALMATYNCZYK] == true,
                    isRaceGuessed: raceGuessedDictionary[DoggoStore.DALMATYNCZYK] == true,
                    qrCode: "o3fg(11)",
                    borderColor: DoggoStore.PINK_BORDER_UI_COLOR
            ),
            .init(
                    race: DoggoStore.OWCZAREK_AUSTRALIJSKI,
                    letterIndex: 11,
                    image: UIImage(named: DoggoStore.OWCZAREK_AUSTRALIJSKI.lowercased()),
                    isUnlocked: unlockDictionary[DoggoStore.OWCZAREK_AUSTRALIJSKI] == true,
                    isRaceGuessed: raceGuessedDictionary[DoggoStore.OWCZAREK_AUSTRALIJSKI] == true,
                    qrCode: "https://tinyurl.com/kz833h3j",
                    borderColor: DoggoStore.PINK_BORDER_UI_COLOR
            )
        ]
    }

    func unlockDoggo(race: String) {
        unlockDictionary[race] = true
    }

    func setRaceGuessed(race: String) {
        raceGuessedDictionary[race] = true
    }

    func currentPassword() -> String {
        let doggos = doggos()
        var securePassword = (0..<Const.password.count).map { _ in
                    "*"
                }
                .joined(separator: "")
        doggos.forEach { doggo in
            if doggo.isRaceGuessed {
                let rs = securePassword.index(securePassword.startIndex, offsetBy: doggo.letterIndex)
                securePassword.replaceSubrange((rs...rs), with: Const.password[rs...rs])
            }
        }

        return securePassword
    }
}

enum Const {
    static let password = "Haker i Beza"
}
