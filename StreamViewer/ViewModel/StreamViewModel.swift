//
//  StreamViewModel.swift
//  StreamViewer
//
//  Created by Christian on 26/05/19.
//  Copyright © 2019 Christian. All rights reserved.
//

import Foundation


class StreamViewModel {
    private var channels = [Channel]() {
        didSet {
            reloadChannelsClosure?()
        }
    }
    private var chatMessages = [ChatMessage]() {
        didSet {
            reloadChatMessagesClosure?()
        }
    }
    
    var reloadChannelsClosure: (()->())?
    var reloadChatMessagesClosure: (()->())?
    
    func initViewModel() {
        initChannels()
        initChatMessages()
    }
}

//MARK:- channel related
extension StreamViewModel {
    private func initChannels() {
        let data = DataLoader.loadDataFromFile(filename: "channel", extension: "json")
        
        guard let jsonData = data, let channels = try? JSONDecoder().decode([Channel].self, from: jsonData) else {
            return
        }
        
        self.channels = channels
    }
    func getChannelsCount() -> Int {
        return channels.count
    }
    func requestChannel(handler: ChannelHandler, index: Int) {
        handler.setChannel(channels[index])
    }
    
}

//MARK:- chatMessage related
extension StreamViewModel {
    private func initChatMessages() {
        
        guard let jsonData = DataLoader.loadDataFromFile(filename: "chatMessage", extension: "json") else {
            return
        }
        guard let chatMessages = try? JSONDecoder().decode([ChatMessage].self, from: jsonData) else {
            return
        }
        self.chatMessages = chatMessages
        /*do {
            let cMessages = try JSONDecoder().decode([ChatMessage].self, from: jsonData)
            print(cMessages.count)
            
            self.chatMessages = cMessages
        } catch (let error) {
            print(error.localizedDescription)
        }*/
        
    }
    func getChatMessagesCount() -> Int {
        return chatMessages.count
    }
    func requestChatMessage(handler: ChatMessageHandler, index: Int) {
        handler.setChatMessage(chatMessages[index])
    }
    
}
