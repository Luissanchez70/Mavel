//
//  GetCharacterUseCase.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 2/7/24.
//

import Foundation
import Combine

class GetCharacterUseCase {
    
    func execute() -> AnyPublisher<[Character], Error> {
        
        let urlComponents = URLComponents(path: "/characters")
        let urlRequest = URLRequest(urlComponents: urlComponents)
        return URLSession.shared
            .fetch(urlRequest: urlRequest, type: ResposeCharacter.self)
            .map { $0.data.results }
            .eraseToAnyPublisher()
    }
}
