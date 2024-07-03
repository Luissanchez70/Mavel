//
//  Serie.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 3/7/24.
//

import Foundation

struct ResponseSerie: Decodable {
    let data: SerieData
}
struct SerieData: Decodable {
    let offset: Int
    let limit: Int
    let total: Int
    let results: [Serie]
}
struct Serie: Decodable {
    let id: Int
    let title: String
    let description: String?
    let thumbnail: Thumbnail
}
