//
//  ViewController.swift
//  Doggos
//
//  Created by Kwiatkowski, Rafal on 02/09/2022.
//

import UIKit

class DoggosViewController: UIViewController {

    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var scanButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    private var store = DoggoStore()
    private var doggos: [Doggo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "DoggoCell", bundle: .main), forCellWithReuseIdentifier: "DoggoCell")
        reloadData()
    }
    
    private func reloadData() {
        doggos = store.doggos()
        collectionView.reloadData()
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        print("")
        return true
    }
}

extension DoggosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        doggos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DoggoCell", for: indexPath) as! DoggoCell
        let doggo = doggos[indexPath.item]
        if doggo.isUnlocked {
            cell.nameLabel.text = doggo.isRaceGuessed ? doggo.race : "Guess my race!"
        } else {
            cell.nameLabel.text = doggo.isRaceGuessed ? doggo.race : "Unlock me!"
        }
        
        cell.imageView.image = doggo.isUnlocked ? doggo.image : UIImage(named: "placeholder")
        return cell
    }
}

extension DoggosViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 120, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let doggo = doggos[indexPath.item]
        store.unlockDoggo(race: doggo.race)
        reloadData()
    }
}
