//
//  UIButtonExtension.swift
//  StreamViewer
//
//  Created by Christian on 26/05/19.
//  Copyright © 2019 Christian. All rights reserved.
//

import UIKit

// with the help of: https://gist.github.com/phpmaple/9458264
extension UIButton {
    func centerImageAndButton(_ gap: CGFloat, imageOnTop: Bool) {
        
        guard let imageView = self.imageView,
            let titleLabel = self.titleLabel else { return }
        
        let sign: CGFloat = imageOnTop ? 1 : -1
        let imageSize = imageView.frame.size
        self.titleEdgeInsets = UIEdgeInsets(top: (imageSize.height+gap)*sign, left: -imageSize.width, bottom: 0, right: 0)
        
        let titleSize = titleLabel.bounds.size;
        self.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height+gap)*sign, left: 0, bottom: 0, right: -titleSize.width)
    }
}
