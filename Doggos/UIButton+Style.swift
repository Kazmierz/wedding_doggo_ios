//
//  UIButton+Style.swift
//  Doggos
//
//  Created by Robert Kaleciński on 10/09/2022.
//

import Foundation
import UIKit

extension UIButton {
    func applyPrimaryButtonStyle() {
        backgroundColor = Colors.greenBackground
        setTitleColor(Colors.greenBorder, for: .normal)
        layer.borderColor = Colors.greenBorder.cgColor
        layer.borderWidth = 1
        //layer.cornerRadius = 6
    }
    
    func applySecondaryButtonStyle() {
        setTitleColor(.black, for: .normal)
        layer.borderColor = Colors.greenBorder.cgColor
        layer.borderWidth = 1
        //layer.cornerRadius = 6
    }
}
