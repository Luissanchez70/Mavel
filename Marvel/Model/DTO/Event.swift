//
//  Event.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 3/7/24.
//

import Foundation

struct ResponseEvent: Decodable {
    let data: EventData
}
struct EventData: Decodable {
    let offset: Int
    let limit: Int
    let total: Int
    let results: [Event]
}
struct Event: Decodable {
    let id: Int
    let title: String
    let description: String?
    let thumbnail: Thumbnail
}

