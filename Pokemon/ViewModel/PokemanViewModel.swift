//
//  PokemanViewModel.swift
//  Pokemon
//
//  Created by Abdul Rahim on 11/06/21.
//

import Foundation

struct PokemanViewModel {
    func getAPIData(param: [String: Any], completion: @escaping (PokemonModel?, ServiceError?) -> ()) {
        let request = PokemanAPI()
        
        let apiLoader = APILoader(apiHandler: request)
        apiLoader.loadAPIRequest() { (model, error) in
            if let _ = error {
                completion(nil, error)
            } else {
                completion(model, nil)
            }
        }
    }
}
