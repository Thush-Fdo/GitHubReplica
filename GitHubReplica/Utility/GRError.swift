//
//  GRError.swift
//  GitHubReplica
//
//  Created by Thush-Fdo on 16/06/2024.
//

import Foundation

enum GRError: String, Error {
    case invalidRequest = "This username created and invalid request. Please try again"
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try again"
    case invalidData = "Data received from the server is invalid. Please try again"
    case decodeError = "Data decoding is having a fault. Please try again"
    case unableToFavorite = "There was an error making this user as Favorite"
    case alreadyInFavorite = "Follower is already in Favorites"
}

