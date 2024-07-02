//
//  URLSession+Client.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 1/7/24.
//

import Foundation
import Combine

extension URLSession {
    
    func fetch<Response: Decodable>(urlRequest: URLRequest, type: Response.Type) -> AnyPublisher<Response, Error> {
        print(urlRequest)
        return self.dataTaskPublisher(for: urlRequest)
            .tryMap(processResponse)
            .decode(type: type.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}

extension URLSession {
    
    func processResponse(data: Data, response: URLResponse) throws -> Data {
        
        guard let response = response as? HTTPURLResponse else {
            throw URLError(URLError.cannotDecodeContentData)
        }
        
        switch response.statusCode {
        case 200...299:
            return data
        case 400...499:
            throw URLError(URLError.badURL)
        default:
            throw URLError(URLError.badServerResponse)
        }
    }
}
