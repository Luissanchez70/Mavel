//
//  GetEventUseCase.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 3/7/24.
//

import Foundation
import Combine

class GetEventUseCase: GetResourseProtocol {
    
    func execute(baseResource: TypeOfItem? = nil, id: Int? = nil, type: TypeOfItem) -> AnyPublisher<[Event], Error> {
        
        let urlComponents = if let baseResource = baseResource, let id = id {
            URLComponents(path: "/\(baseResource)/\(id)/\(type)")
        } else {
            URLComponents(path: "/\(type)")
        }
        
        let urlRequest = URLRequest(urlComponents: urlComponents)
        return URLSession.shared
            .fetch(urlRequest: urlRequest, type: ResponseEvent.self)
            .map { $0.data.results }
            .eraseToAnyPublisher()
    }
}

