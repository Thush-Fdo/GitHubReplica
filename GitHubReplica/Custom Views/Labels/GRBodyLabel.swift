//
//  GRBodyLabel.swift
//  GitHubReplica
//
//  Created by Thush-Fdo on 13/06/2024.
//

import UIKit

class GRBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textalignment: NSTextAlignment){
        self.init(frame: .zero)
        self.textAlignment = textalignment
    }
    
    private func configure(){
        textColor = .secondaryLabel
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontForContentSizeCategory = true
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
}
