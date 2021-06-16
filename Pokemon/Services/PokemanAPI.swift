//
//  PokemanAPI.swift
//  Pokemon
//
//  Created by Abdul Rahim on 11/06/21.
//

import Foundation


struct PokemanAPI: APIHandler {
   
    typealias RequestDataType = PokemanAPI
    

    func makeRequest() -> URLRequest? {
        let urlString =  APIPath().pokemon
        if var url = URL(string: urlString) {
//            if param.count > 0 {
//                url = setQueryParams(parameters: param, url: url)
//            }
            var urlRequest = URLRequest(url: url)
            //setDefaultHeaders(request: &urlRequest)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            return urlRequest
        }
        return nil
    }
    
    func parseResponse(data: Data, response: HTTPURLResponse) throws -> PokemonModel {
        return try defaultParseResponse(data: data,response: response)
    }
    
}
