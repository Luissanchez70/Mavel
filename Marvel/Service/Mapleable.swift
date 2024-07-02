//
//  Mapleable.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 1/7/24.
//

import Foundation

protocol Mapleable {
    func map(_ transform: (inout Self) -> Void) -> Self
}

extension Mapleable {
    func map(_ transform: (inout Self) -> Void) -> Self {
        var request = self
        transform(&request)
        return request
    }
}
