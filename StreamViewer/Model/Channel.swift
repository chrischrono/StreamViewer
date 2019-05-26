//
//  Channel.swift
//  StreamViewer
//
//  Created by Christian on 25/05/19.
//  Copyright © 2019 Christian. All rights reserved.
//

import Foundation


struct Channel: Codable {
    let name: String
    let imageUrl: String
    let isFavorite: Bool
    let newMessageCount: Int
}

protocol ChannelHandler {
    func setChannel(_ channel: Channel)
}
