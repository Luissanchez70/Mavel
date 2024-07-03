//
//  GetComicsUseCase.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 2/7/24.
//

import Foundation
import Combine

class GetComicsUseCase {
    
    func execute(path: TypeOfItem? = nil, id: Int? = nil, type: TypeOfItem) -> AnyPublisher<[Comic], Error> {
        
        let urlComponents = if let path = path, let id = id {
            URLComponents(path: "\(path)/\(id)/\(type)")
        } else {
            URLComponents(path: "/\(type)")
        }
        
        let urlRequest = URLRequest(urlComponents: urlComponents)
        return URLSession.shared
            .fetch(urlRequest: urlRequest, type: ResposeComic.self)
            .map { $0.data.results }
            .eraseToAnyPublisher()
    }
}
