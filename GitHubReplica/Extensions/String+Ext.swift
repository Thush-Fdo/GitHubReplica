//
//  String+Ext.swift
//  GitHubReplica
//
//  Created by Thush-Fdo on 16/06/2024.
//

import Foundation

/*this class is not being used by the solution. With the changes made to the User model with createdAt: String -->  Date, and introducing the decoder.dateDecodingStrategy = .iso8601 in Network manager, the  UserInfoVC is directly dealing with convertToMonthYearFormat() in the Date Extension */

extension String {
    func convertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current
        
        return dateFormatter.date(from: self)
    }
    
    func convertToDisplayFormat() -> String {
        guard let date = self.convertToDate() else { return "N/A"}
        
        return date.convertToMonthYearFormat()
    }
}
