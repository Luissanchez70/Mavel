//
//  GetComicsUseCase.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 2/7/24.
//

import Foundation
import Combine

class GetComicsUseCase {
    
    func execute() -> AnyPublisher<[Comic], Error> {
        
        let urlComponents = URLComponents(path: "/comics")
        let urlRequest = URLRequest(urlComponents: urlComponents)
        return URLSession.shared
            .fetch(urlRequest: urlRequest, type: ResposeComic.self)
            .map { $0.data.results }
            .eraseToAnyPublisher()
    }
}
