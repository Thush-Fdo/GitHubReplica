//
//  Date+Ext.swift
//  GitHubReplica
//
//  Created by Thush-Fdo on 16/06/2024.
//

import Foundation

extension Date {
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        
        return dateFormatter.string(from: self)
    }
}
