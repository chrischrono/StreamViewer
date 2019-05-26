//
//  File.swift
//  StreamViewer
//
//  Created by Christian on 25/05/19.
//  Copyright © 2019 Christian. All rights reserved.
//

import Foundation


class ChannelCellViewModel {
    enum BadgeType {
        case none
        case favorite
        case newMessage
    }
    private var channel: Channel?
    
    private(set) var badgeType: BadgeType = .none
    private(set) var badgeText: String?
    var name: String? {
        return channel?.name
    }
    var imageUrl: String? {
        return channel?.imageUrl
    }
    
    var configureCellViewClosure: (()->())?
}

extension ChannelCellViewModel: ChannelHandler {
    func setChannel(_ channel: Channel) {
        self.channel = channel
        if channel.isFavorite {
            badgeType = .favorite
            badgeText = "★"
        } else if channel.newMessageCount > 0 {
            badgeType = .newMessage
            badgeText = "\(channel.newMessageCount)"
        } else {
            badgeType = .none
            badgeText = nil
        }
        configureCellViewClosure?()
    }
    
    
}
