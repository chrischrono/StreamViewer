//
//  BasicUI.swift
//  StreamViewer
//
//  Created by Christian on 26/05/19.
//  Copyright © 2019 Christian. All rights reserved.
//

import UIKit

struct BasicUI {
    
    static func createView(color: String = "FFFFFF", alpha: CGFloat = 1) -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: color)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    static func createLabel(text: String, font: UIFont = UIFont.systemFont(ofSize: 15), alignment: NSTextAlignment = .left, color: String = "000000") -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textAlignment = alignment
        label.textColor = UIColor(hexString: color)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
