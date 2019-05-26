//
//  StreamViewController.swift
//  StreamViewer
//
//  Created by Christian on 23/05/19.
//  Copyright © 2019 Christian. All rights reserved.
//

import UIKit

class StreamViewController: UIViewController {
    
    @IBOutlet private weak var channelCollectionView: UICollectionView!
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var chatTableView: UITableView!
    @IBOutlet private weak var gradientView: GradientView!
    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var followButton: UIButton!
    @IBOutlet private weak var shareButton: UIButton!
    @IBOutlet private weak var messageButton: UIButton!
    @IBOutlet private weak var likeHolderView: UIView!
    private let likeButton = LikeButton.instanceFromNib()
    
    private(set) var streamViewModel = StreamViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initView()
        initViewModel()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }


}

//MARK: viewModel related
extension StreamViewController {
    private func initViewModel() {
        streamViewModel.reloadChannelsClosure = { [weak self] in
            DispatchQueue.main.async {
                self?.channelCollectionView.reloadData()
            }
        }
        streamViewModel.reloadChatMessagesClosure = { [weak self] in
            DispatchQueue.main.async {
                self?.chatTableView.reloadData()
            }
        }
        streamViewModel.initViewModel()
    }
}

//MARK: private func
extension StreamViewController {
    private func initView() {
        initCollectionView()
        favoriteButton.layer.cornerRadius = 5
        initTableView()
        let bgColor = self.view.backgroundColor ?? UIColor.black
        gradientView.gradientColors = [ UIColor.clear.cgColor, bgColor.cgColor]
        userImageView.setFullRoundedCorner()
        followButton.setFullRoundedCorner()
        shareButton.centerImageAndButton(5, imageOnTop: true)
        messageButton.centerImageAndButton(5, imageOnTop: true)
        
        likeHolderView.addSubview(likeButton)
        likeButton.initView()
    }
}

//MARK: channelCollectionView related
extension StreamViewController: UICollectionViewDataSource {
    private func initCollectionView() {
        channelCollectionView.register(UINib(nibName: "ChannelViewCell", bundle: nil), forCellWithReuseIdentifier: "ChannelViewCell")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return streamViewModel.getChannelsCount()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChannelViewCell", for: indexPath) as! ChannelViewCell
        streamViewModel.requestChannel(handler: cell.channelCellViewModel, index: indexPath.item)
        
        return cell
    }
}

//MARK: channelCollectionView related
extension StreamViewController: UITableViewDataSource {
    private func initTableView() {
        chatTableView.register(UINib(nibName: "ChatViewCell", bundle: nil), forCellReuseIdentifier: "ChatViewCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return streamViewModel.getChatMessagesCount()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatViewCell", for: indexPath) as! ChatViewCell
        streamViewModel.requestChatMessage(handler: cell.chatCellViewModel, index: indexPath.row)
        return cell
    }
}


