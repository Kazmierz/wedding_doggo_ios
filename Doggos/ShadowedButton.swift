//
//  ShadowedButton.swift
//  Doggos
//
//  Created by Robert Kaleciński on 10/09/2022.
//

import UIKit

final class ShadowedButton: UIButton {

    private var shadowLayer: CAShapeLayer!

    override func layoutSubviews() {
        super.layoutSubviews()

        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 6).cgPath
            //shadowLayer.fillColor = UIColor.red.withAlphaComponent(0.1).cgColor
            shadowLayer.fillColor = backgroundColor?.cgColor
            shadowLayer.cornerRadius = 6

            shadowLayer.shadowColor = UIColor.darkGray.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            shadowLayer.shadowOpacity = 0.2
            shadowLayer.shadowRadius = 6

            layer.insertSublayer(shadowLayer, at: 0)
        }
    }

}
