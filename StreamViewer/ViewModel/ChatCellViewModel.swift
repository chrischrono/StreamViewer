//
//  ChatViewModel.swift
//  StreamViewer
//
//  Created by Christian on 25/05/19.
//  Copyright © 2019 Christian. All rights reserved.
//

import Foundation


class ChatCellViewModel {
    private var chatMessage: ChatMessage?
    
    var nickname: String? {
        return chatMessage?.nickname
    }
    var message: String? {
        return chatMessage?.message
    }
    
    var configureCellViewClosure: (()->())?
}

extension ChatCellViewModel: ChatMessageHandler {
    func setChatMessage(_ chatMessage: ChatMessage) {
        self.chatMessage = chatMessage
        configureCellViewClosure?()
    }
}
