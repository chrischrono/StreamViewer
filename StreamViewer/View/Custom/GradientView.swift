//
//  GradientView.swift
//
//  Created by Christian on 23/05/19.
//  Copyright © 2019 Christian. All rights reserved.
//

import UIKit

class GradientView: UIView {
    private var gradientLayer = CAGradientLayer()
    var gradientColors: [Any]? {
        set(newGradientColors) {
            gradientLayer.colors = newGradientColors
        }
        get {
            return gradientLayer.colors
        }
    }
    var startPoint : CGPoint {
        set(newStartPoint) {
            gradientLayer.startPoint = newStartPoint
        }
        get {
            return gradientLayer.startPoint
        }
    }
    var endPoint : CGPoint {
        set(newEndPoint) {
            gradientLayer.endPoint = newEndPoint
        }
        get {
            return gradientLayer.endPoint
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if gradientLayer.superlayer == nil {
            self.layer.addSublayer(gradientLayer)
        }
        gradientLayer.frame = self.bounds
    }

}
