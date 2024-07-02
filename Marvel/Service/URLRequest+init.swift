//
//  URLRequest+init.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 1/7/24.
//

import Foundation

extension URLRequest {
    
    init(urlComponents: URLComponents) {
        
        guard let url = urlComponents.url else {
            preconditionFailure("Bad URL")
        }
        self = Self(url: url)
    }
}
