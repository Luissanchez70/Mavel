//
//  ResourceItem.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 2/7/24.
//

import Foundation

class ResourceItem {
    
    var id: Int
    let title: String
    let description: String
    let thumbnail: Thumbnail
    
    init(_ character: Character) {
        self.id = character.id
        self.title = character.name
        self.description = character.description
        self.thumbnail = character.thumbnail
    }
    
    init(_ comic: Comic) {
        self.id = comic.id
        self.title = comic.title
        self.description = comic.description ?? "Without Description"
        self.thumbnail = comic.thumbnail
    }
    
}
