//
//  APIHandler.swift
//  Pokemon
//
//  Created by Abdul Rahim on 11/06/21.
//

import Foundation

// MARK: APIHandler

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

protocol RequestHandler {
    associatedtype RequestDataType
    func makeRequest() -> URLRequest?
}

protocol ResponseHandler {
    associatedtype ResponseDataType
    func parseResponse(data: Data, response: HTTPURLResponse) throws -> ResponseDataType
}

typealias APIHandler = RequestHandler & ResponseHandler
