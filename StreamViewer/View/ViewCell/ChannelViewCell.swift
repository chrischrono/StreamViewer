//
//  ChannelViewCell.swift
//  StreamViewer
//
//  Created by Christian on 23/05/19.
//  Copyright © 2019 Christian. All rights reserved.
//

import UIKit

class ChannelViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var channelOuterView: UIView!
    @IBOutlet private weak var channelImageView: UIImageView!
    @IBOutlet private weak var badgeView: UIView!
    @IBOutlet private weak var badgeLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    
    private(set) var channelCellViewModel = ChannelCellViewModel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initView()
        initViewModel()
    }

}

//MARK:- viewModel related
extension ChannelViewCell {
    private func initViewModel() {
        channelCellViewModel.configureCellViewClosure = configureCell
    }
}

//MARK:- private func
extension ChannelViewCell {
    private func initView() {
        channelOuterView.setFullRoundedCorner(borderWidth: 2, borderColor: UIColor.gray.cgColor)
        channelImageView.setFullRoundedCorner(borderWidth: 3, borderColor: UIColor.blue.cgColor)
        badgeView.setFullRoundedCorner()
    }
    private func configureCell() {
        var badgeAlpha: CGFloat = 1
        var badgeColor = UIColor.white
        var badgeTextColor = UIColor.black
        var borderColor = UIColor.gray
        switch channelCellViewModel.badgeType {
        case .favorite:
            borderColor = UIColor.white
            badgeColor = UIColor.white
            badgeTextColor = UIColor.black
        case .newMessage:
            borderColor = UIColor.orange
            badgeColor = UIColor.red
            badgeTextColor = UIColor.white
        default:
            badgeAlpha = 0
        }
        badgeView.alpha = badgeAlpha
        badgeView.backgroundColor = badgeColor
        badgeLabel.text = channelCellViewModel.badgeText
        badgeLabel.textColor = badgeTextColor
        channelOuterView.layer.borderColor = borderColor.cgColor
        channelImageView.image = UIImage(named: channelCellViewModel.imageUrl ?? "")
        nameLabel.text = channelCellViewModel.name
    }
}
