//
//  DoggoCell.swift
//  Doggos
//
//  Created by Kwiatkowski, Rafal on 02/09/2022.
//

import UIKit

class DoggoCell: UICollectionViewCell {
    @IBOutlet weak var doggoImageView: UIImageView!
    @IBOutlet weak var placeholderImageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    func configure(for doggo: Doggo) {
        if doggo.isUnlocked {
            textLabel.text = doggo.isRaceGuessed ? doggo.race : "co to za rasa?"
        } else {
            textLabel.text = doggo.isRaceGuessed ? doggo.race : "znajdź mnie"
        }

        doggoImageView.isHidden = !doggo.isUnlocked
        placeholderImageView.isHidden = doggo.isUnlocked
        doggoImageView.image = doggo.image
        placeholderImageView.image = UIImage(named: "placeholder")
        contentView.backgroundColor = Colors.greenBackground
        textLabel.textColor = Colors.greenBorder
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.borderColor = Colors.greenBorder.cgColor
        layer.borderWidth = 2
        layer.cornerRadius = 16
    }
}
