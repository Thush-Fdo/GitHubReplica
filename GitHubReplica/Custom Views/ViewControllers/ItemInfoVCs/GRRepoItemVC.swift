//
//  GRRepoItemVC.swift
//  GitHubReplica
//
//  Created by Thush-Fdo on 16/06/2024.
//

import UIKit

protocol GRRepoItemVCDelegate: AnyObject {
    func didTapGitHubProfile(for user: User)
}

class GRRepoItemVC: GRItemInfoVC {    
    
    weak var delegate: GRRepoItemVCDelegate!
    
    init(user: User, delegate: GRRepoItemVCDelegate) {
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
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }
}
