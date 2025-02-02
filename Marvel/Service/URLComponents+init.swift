//
//  URLComponents+init.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 1/7/24.
//

import Foundation

extension URLComponents: Mapleable {
    
    private static let apikey = "bc4a5be3c71e12dfd6eb20c3f3495f7e"
    private static let hash = "aebd96392d20f5aa7027d0de97255c03"
    private static let ts = "1"
    
    init(schame: String = "https", host: String = "gateway.marvel.com", path: String) {
        self.init()
        self.scheme = schame
        self.host = host
        self.path = "/v1/public\(path)"
        self.queryItems = [URLQueryItem(name: "ts", value: URLComponents.ts),
                           URLQueryItem(name: "apikey", value: URLComponents.apikey),
                           URLQueryItem(name: "hash", value: URLComponents.hash)]
    }
    
    func addParams(name: String, value: String) -> Self {
        map{
            $0.queryItems?.append(URLQueryItem(name: name, value: value))
        }
    }
}
