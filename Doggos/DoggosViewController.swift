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
        passwordLabel.text = store.currentPassword()
    }
    
    private func reloadData() {
        doggos = store.doggos()
        collectionView.reloadData()
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        print("")
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "scan") {
            (segue.destination as? ScanViewController)?.delegate = self
        }
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
        .init(width: (view.bounds.width / 2) - 16, height: (view.bounds.width / 2) - 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let doggoViewController = storyboard.instantiateViewController(withIdentifier: "DoggoDetailsViewController") as! DoggoDetailsViewController
        doggoViewController.doggo = doggos[indexPath.item]
        doggoViewController.delegate = self
        present(doggoViewController, animated: true)
    }
}

extension DoggosViewController: ScanViewControllerDelegate {
    func foundCode(code: String) {
        guard let doggo = doggos.first(where: { $0.qrCode == code }) else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                let alert = UIAlertController(title: "This is not doggo!", message: nil, preferredStyle: .alert)
                alert.addAction(.init(title: "OK", style: .cancel))
                self.present(alert, animated: true)
            }
            return
        }
        
        store.unlockDoggo(race: doggo.race)
        reloadData()
    }
}

extension DoggosViewController: DoggoDetailsViewControllerDelegate {
    func setRaceGuessed(for race: String) {
        store.setRaceGuessed(race: race)
        reloadData()
        passwordLabel.text = store.currentPassword()
    }
}
