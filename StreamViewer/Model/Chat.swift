//
//  Chat.swift
//  StreamViewer
//
//  Created by Christian on 25/05/19.
//  Copyright © 2019 Christian. All rights reserved.
//

import Foundation


struct ChatMessage: Codable {
    let nickname: String
    let message: String
    
}

protocol ChatMessageHandler {
    func setChatMessage(_ chatMessage: ChatMessage)
}
