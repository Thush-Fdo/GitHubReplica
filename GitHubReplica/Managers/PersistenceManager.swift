//
//  PersistenceManager.swift
//  GitHubReplica
//
//  Created by Thush-Fdo on 17/06/2024.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func updateWith (favorite: Follower, actionType: PersistenceActionType, completed: @escaping (GRError?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(var favorites):
                
                switch actionType {
                case .add:
                    guard !favorites.contains(favorite) else {
                        completed(.alreadyInFavorite)
                        return
                    }
                    
                    favorites.append(favorite)
                    
                case.remove:
                    favorites.removeAll { $0.login == favorite.login }
                }
                
                completed(save(favorites: favorites))
                
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    static func retrieveFavorites(completed: @escaping (Result<[Follower], GRError>) -> Void) {
        guard let favoriteData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoriteData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    static func save(favorites: [Follower]) -> GRError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}
