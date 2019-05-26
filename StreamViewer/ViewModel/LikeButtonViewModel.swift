//
//  LikeButtonViewModel.swift
//  StreamViewer
//
//  Created by Christian on 26/05/19.
//  Copyright © 2019 Christian. All rights reserved.
//

import Foundation

protocol LikeButtonViewModelDelegate: class {
    func likeButtonTappable() -> Bool
}

class LikeButtonViewModel {
    private var count = 0
    private var tapCount = 0 {
        didSet {
            addLikeCountViewClosure?(tapCount, count)
        }
    }
    
    weak var delegate: LikeButtonViewModelDelegate?
    
    var addLikeCountViewClosure: ((Int, Int)->())?
    
    func userTappedLike() {
        guard delegate?.likeButtonTappable() ?? true else {
            return
        }
        count += 1
        tapCount += 1
    }
}


