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
            setRaceGuesed()
        }
    }
    
    @IBAction func textChanged(_ textField: UITextField) {
        if textField.text?.contains(doggo.race) == true {
            setRaceGuesed()
            delegate?.setRaceGuessed(for: doggo.race)
        }
    }
    
    func setRaceGuesed() {
        textField.text = doggo.race
        textField.isEnabled = false
        textField.textColor = .green
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
