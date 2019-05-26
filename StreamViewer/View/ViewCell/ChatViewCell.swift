//
//  ChatViewCell.swift
//  StreamViewer
//
//  Created by Christian on 23/05/19.
//  Copyright © 2019 Christian. All rights reserved.
//

import UIKit

class ChatViewCell: UITableViewCell {
    
    @IBOutlet private weak var messageLabel: UILabel!
    var nicknameColor = UIColor.white {
        didSet {
            updateNicknameAttribute()
        }
    }
    private var nicknameAttribute = [ NSAttributedString.Key.foregroundColor: UIColor.white ]
    
    private(set) var chatCellViewModel = ChatCellViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initViewModel()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state peter frans koops
    }
    
}

//MARK: viewModel related
extension ChatViewCell {
    private func initViewModel() {
        chatCellViewModel.configureCellViewClosure = configureCell
    }
}

//MARK: private func
extension ChatViewCell {
    private func configureCell() {
        let attrString = NSMutableAttributedString(string: chatCellViewModel.nickname ?? "", attributes: nicknameAttribute)
        attrString.append(NSAttributedString(string: String(format:"   %@", chatCellViewModel.message ?? "")))
        messageLabel.attributedText = attrString
    }
    private func updateNicknameAttribute() {
        nicknameAttribute = [ NSAttributedString.Key.foregroundColor: UIColor.white ]
    }
}
