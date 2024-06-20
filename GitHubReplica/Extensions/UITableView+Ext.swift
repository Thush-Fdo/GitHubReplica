//
//  UITableView+Ext.swift
//  GitHubReplica
//
//  Created by Thush-Fdo on 19/06/2024.
//

import UIKit

extension UITableView {
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
