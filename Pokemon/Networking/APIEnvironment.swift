//
//  APIEnvironment.swift
//  Pokemon
//
//  Created by Abdul Rahim on 11/06/21.
//

//"https://pokeapi.co/api/v2/pokemon/"

import Foundation

enum APIEnvironment {
    case development
    case staging
    case production
    
    func baseURL () -> String {
        return "https://\(subdomain()).\(domain())"
    }
    
    func domain() -> String {
        switch self {
        case .development:
            return "co"
        case .staging:
            return "co"
        case .production:
            return "co"
        }
    }
    
    func subdomain() -> String {
        switch self {
        case .development, .production, .staging:
            return "pokeapi"
        }
    }
    
    func route() -> String {
        return "/api/v2"
    }
}
