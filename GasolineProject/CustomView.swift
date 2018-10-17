//
//  CustomView.swift
//  GasolineProject
//
//  Created by Andre Faruolo on 04/09/2018.
//  Copyright © 2018 Andre Faruolo. All rights reserved.
//

import UIKit

class CustomView: UIView {

    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }

}
