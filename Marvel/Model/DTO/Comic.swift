//
//  Comic.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 2/7/24.
//

import Foundation

struct ResposeComic: Decodable {
    let data: ComicData
}
struct ComicData: Decodable {
    let offset: Int
    let limit: Int
    let total: Int
    let results: [Comic]
}
struct Comic: Decodable {
    let id: Int
    let title: String
    let description: String
    let thumbnail: Thumbnail
}
