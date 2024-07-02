//
//  Character.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 1/7/24.
//

import Foundation

struct ResposeCharacter: Decodable {
    let data: CharacterData
}
struct CharacterData: Decodable {
    let offset: Int
    let limit: Int
    let total: Int
    let results: [Character]
}
struct Character: Decodable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
}
