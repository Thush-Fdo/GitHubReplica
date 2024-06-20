//
//  GRUserInfoHeaderVC.swift
//  GitHubReplica
//
//  Created by Thush-Fdo on 16/06/2024.
//

import UIKit

class GRUserInfoHeaderVC: UIViewController {

    let avatarImageView = GRAvatarImageView(frame: .zero)
    let usernameLabel = GRTitleLabel(textalignment: .left, fontsize: 34)
    let nameLabel = GRSecondaryTitleLabel(fontSize: 18)
    let locationImagView = UIImageView()
    let locationLabel = GRSecondaryTitleLabel(fontSize: 18)
    let bioLabel = GRBodyLabel(textalignment: .left)
    
    var user: User!
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        layoutUI()
        configureUIElements()
    }
    
    func configureUIElements() {
        downloadAvatarImage()
        usernameLabel.text = user.login
        nameLabel.text = user.name ?? "N/A"
        locationLabel.text = user.location ?? "No Location"
        bioLabel.text = user.bio ?? "No bio available"
        bioLabel.numberOfLines = 3
        
        locationImagView.image = SFSymbols.location
        locationImagView.tintColor = .secondaryLabel
    }
    
    func downloadAvatarImage() {
        NetworkManager.shared.downloadImage(from: user.avatarUrl) { [weak self] Image in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.avatarImageView.image = Image
            }
        }
    }
    
    func addSubviews() {
        view.addSubviews(avatarImageView, usernameLabel, nameLabel, locationImagView, locationLabel, bioLabel)
    }

    func layoutUI() {
        let padding: CGFloat = 20
        let textImagePadding: CGFloat = 12
        locationImagView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 90),
            avatarImageView.heightAnchor.constraint(equalToConstant: 90),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            usernameLabel.heightAnchor.constraint(equalToConstant: 38),
            
            nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            locationImagView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            locationImagView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            locationImagView.widthAnchor.constraint(equalToConstant: 20),
            locationImagView.heightAnchor.constraint(equalToConstant: 20),
            
            locationLabel.centerYAnchor.constraint(equalTo: locationImagView.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationImagView.trailingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            bioLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: textImagePadding),
            bioLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bioLabel.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
}
