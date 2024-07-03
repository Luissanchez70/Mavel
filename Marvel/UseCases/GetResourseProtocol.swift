//
//  GetResourseProtocol.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 3/7/24.
//

import Foundation
import Combine

protocol GetResourseProtocol {
    
    associatedtype DataType
    func execute(baseResource: TypeOfItem?, id: Int?, type: TypeOfItem) -> AnyPublisher<[DataType], Error>

}
