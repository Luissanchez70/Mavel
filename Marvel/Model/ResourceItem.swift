//
//  ResourceItem.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 2/7/24.
//

import Foundation

class ResourceItem {
    
    let id: Int
    let title: String
    let description: String
    let thumbnailSTR: String
    let type: TypeOfItem
    
    init(_ character: Character) {
        self.id = character.id
        self.title = character.name
        self.description = character.description
        self.thumbnailSTR = character.thumbnail.path.replacingOccurrences(of: "http", with: "https") + "." + character.thumbnail.extension
        self.type = .characters
    }
    
    init(_ comic: Comic) {
        self.id = comic.id
        self.title = comic.title
        self.description = comic.description ?? "Without Description"
        self.thumbnailSTR = comic.thumbnail.path.replacingOccurrences(of: "http", with: "https") + "." + comic.thumbnail.extension
        self.type = .comics
    }
    
    init(_ event: Event) {
        self.id = event.id
        self.title = event.title
        self.description = event.description ?? "Without Description"
        self.thumbnailSTR = event.thumbnail.path.replacingOccurrences(of: "http", with: "https") + "." + event.thumbnail.extension
        self.type = .comics
    }
    
    init(_ serie: Serie) {
        self.id = serie.id
        self.title = serie.title
        self.description = serie.description ?? "Without Description"
        self.thumbnailSTR = serie.thumbnail.path.replacingOccurrences(of: "http", with: "https") + "." + serie.thumbnail.extension
        self.type = .comics
    }
    
}
