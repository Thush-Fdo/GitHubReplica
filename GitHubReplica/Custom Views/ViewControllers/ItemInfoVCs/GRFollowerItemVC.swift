//
//  GRFollowerItemVC.swift
//  GitHubReplica
//
//  Created by Thush-Fdo on 16/06/2024.
//

import UIKit

protocol GRFollowerItemVCDelegate: AnyObject {
    func didTapGetFollowers(for user: User)
}

class GRFollowerItemVC: GRItemInfoVC {
    
    weak var delegate: GRFollowerItemVCDelegate!
    
    init(user: User, delegate: GRFollowerItemVCDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
