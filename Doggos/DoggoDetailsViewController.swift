//
//  DoggoDetailsViewController.swift
//  Doggos
//
//  Created by Kwiatkowski, Rafal on 02/09/2022.
//

import UIKit

protocol DoggoDetailsViewControllerDelegate: AnyObject {
    func setRaceGuessed(for race: String)
}

class DoggoDetailsViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    weak var delegate: DoggoDetailsViewControllerDelegate?
    
    var doggo: Doggo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = doggo?.image
        
        if doggo.isRaceGuessed {
            setRaceGuessed()
        }
    }
    
    @IBAction func textChanged(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if text.lowercased().contains(doggo.race.lowercased()) {
            setRaceGuessed()
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [unowned self] in
                self.delegate?.setRaceGuessed(for: self.doggo.race)
                self.dismiss(animated: true)
            }
        }
    }
    
    func setRaceGuessed() {
        textField.text = doggo.race + "  ✅"
        textField.isEnabled = false
        textField.textColor = Colors.greenBorder
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true)
    }
}
