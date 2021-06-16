//
//  APIPath.swift
//  Pokemon
//
//  Created by Abdul Rahim on 11/06/21.
//

import Foundation

#if DEBUG
let environment = APIEnvironment.development
#else
let environment = APIEnvironment.production
#endif

let baseURL = environment.baseURL()

struct APIPath {
    var pokemon: String { return "\(baseURL)/api/v2/pokemon"}

}
