//
//  LikeButton.swift
//  StreamViewer
//
//  Created by Christian on 26/05/19.
//  Copyright © 2019 Christian. All rights reserved.
//

import UIKit

class LikeButton: UIView {
    
    @IBOutlet private weak var pulseHolderView: UIView!
    @IBOutlet private weak var countHolderView: UIView!
    @IBOutlet private weak var starLabel: UILabel!
    @IBOutlet private weak var countLabel: UILabel!
    
    private var pulseViewList = [Int: UIView]()
    private var countViewList = [Int: UILabel]()
    private let countColor = ["00FFFF", "00FF00",
                              "FFFF00", "FFBB00", "FF0055"]
    
    private(set) var likeButtonViewModel = LikeButtonViewModel()
    
    class func instanceFromNib() -> LikeButton {
        return UINib(nibName: "LikeButton", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! LikeButton
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initViewModel()
    }

    @IBAction func likeButtonDidTapped(sender: UIButton) {
        likeButtonViewModel.userTappedLike()
    }

    func initView() {
        guard let superview = superview else {
            return
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: self.bounds.width),
            self.heightAnchor.constraint(equalToConstant: self.bounds.height),
            self.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            ])
        starLabel.setFullRoundedCorner()
    }
}

//MARK:- viewModel related
extension LikeButton {
    private func initViewModel() {
        likeButtonViewModel.addLikeCountViewClosure = { [weak self] (tapCount, count) in
            guard  let self = self else {
                return
            }
            DispatchQueue.main.async {
                self.addLikeCountView(tapCount: tapCount, count: count)
            }
        }
    }
}

//MARK:- private func
extension LikeButton {
    private func addLikeCountView(tapCount: Int, count: Int) {
        countLabel.text = "\(count)"
        addPulseView(count: tapCount)
        addCountView(count: tapCount)
    }
    
    private func addPulseView(count: Int) {
        let pulse = BasicUI.createView(color: "F4B465", alpha: 0.8)
        pulseHolderView.addSubview(pulse)
        NSLayoutConstraint.activate([
            pulse.widthAnchor.constraint(equalTo: pulseHolderView.widthAnchor),
            pulse.heightAnchor.constraint(equalTo: pulseHolderView.heightAnchor),
            pulse.centerXAnchor.constraint(equalTo: pulseHolderView.centerXAnchor),
            pulse.centerYAnchor.constraint(equalTo: pulseHolderView.centerYAnchor)
            ])
        pulseHolderView.layoutIfNeeded()
        pulse.setFullRoundedCorner()
        
        pulse.tag = count
        pulseViewList[count] = pulse
        UIView.animate(withDuration: 0.5, animations: {
            pulse.transform = CGAffineTransform(scaleX: 3, y: 3)
            pulse.alpha = 0
        }) { [weak self] (_) in
            pulse.removeFromSuperview()
            self?.pulseViewList[count] = nil
        }
    }
    private func addCountView(count: Int) {
        let countView = BasicUI.createLabel(text: "+\(count)", font: UIFont.systemFont(ofSize: min(10 + CGFloat(count), 20)), color: countColor[count % countColor.count])
        countHolderView.addSubview(countView)
        let topConstraint = countView.topAnchor.constraint(equalTo: countHolderView.topAnchor, constant: 0)
        let random = CGFloat.random(in: -25..<0)
        NSLayoutConstraint.activate([
            topConstraint,
            countView.centerXAnchor.constraint(equalTo: countHolderView.centerXAnchor, constant: random)
            ])
        countHolderView.layoutIfNeeded()
        
        countView.tag = count
        countViewList[count] = countView
        topConstraint.constant = -50
        UIView.animate(withDuration: 0.5, animations: {
            self.countHolderView.layoutIfNeeded()
        }) { (_) in
            countView.removeFromSuperview()
            self.countViewList[count] = nil
        }
    }
}
