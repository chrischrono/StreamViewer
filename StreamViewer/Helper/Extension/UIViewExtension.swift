//
//  UIViewExtension.swift
//
//  Created by Christian on 25/05/19.
//  Copyright © 2019 Christian. All rights reserved.
//

import UIKit


extension UIView {
    func setFullRoundedCorner(borderWidth: CGFloat = 0, borderColor: CGColor = UIColor.clear.cgColor) {
        self.layer.cornerRadius = self.bounds.height / 2
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
    }
}
