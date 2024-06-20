//
//  GRTitleLabel.swift
//  GitHubReplica
//
//  Created by Thush-Fdo on 13/06/2024.
//

import UIKit

class GRTitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textalignment: NSTextAlignment, fontsize: CGFloat){
        self.init(frame: .zero)
        self.textAlignment = textalignment
        self.font = UIFont.systemFont(ofSize: fontsize, weight: .bold)
    }
    
    private func configure(){
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
