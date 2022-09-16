//
//  ViewController.swift
//  Doggos
//
//  Created by Kwiatkowski, Rafal on 02/09/2022.
//

import UIKit

class DoggosViewController: UIViewController {

    @IBOutlet weak var scanButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var passwordStackView: UIStackView!
    @IBOutlet weak var pinkView: UIView!
    
    private var store = DoggoStore()
    private var doggos: [Doggo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "DoggoCell", bundle: .main), forCellWithReuseIdentifier: "DoggoCell")
        reloadData()
        
        pinkView.layer.cornerRadius = 8
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        reloadPasswordView()
    }
    
    private func reloadPasswordView() {
        passwordStackView.subviews.forEach { $0.removeFromSuperview() }
        store.currentPasswordImages()
            .map {
                let iv = UIImageView(image: $0)
                iv.frame = CGRect(x: 0, y: 0, width: 66, height: 66)
                iv.contentMode = .scaleAspectFit
                return iv
            }
            .forEach { passwordStackView.addArrangedSubview($0) }
    }
    
    private func reloadData() {
        doggos = store.doggos()
        
        collectionView.reloadData()
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
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
        cell.configure(for: doggos[indexPath.item])
        return cell
    }
}

extension DoggosViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: (collectionView.bounds.width / 2) - 6, height: (collectionView.bounds.width / 2) - 6)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard doggos[indexPath.item].isUnlocked else { return }
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
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let doggoViewController = storyboard.instantiateViewController(withIdentifier: "DoggoDetailsViewController") as! DoggoDetailsViewController
        doggoViewController.doggo = doggo
        doggoViewController.delegate = self
        present(doggoViewController, animated: true)
    }
}

extension DoggosViewController: DoggoDetailsViewControllerDelegate {
    func setRaceGuessed(for race: String) {
        store.setRaceGuessed(race: race)
        reloadData()
        reloadPasswordView()
    }
}
