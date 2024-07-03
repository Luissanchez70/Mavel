//
//  DetailsViewModel.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 3/7/24.
//

import Foundation

class DetailsViewModel: ObservableObject {

    var resourceItem: ResourceItem
    var listOfType: [TypeOfItem] = [.characters, .comics, .creators, .events, .series, .stories]
    @Published var resourcesList: [TypeOfItem: [ResourceItem]] = [:]
    
    init(_ resourceItem: ResourceItem) {
        self.resourceItem = resourceItem
    }
    
    
    func FecthResources() {
        
        for type in listOfType {
            if type != resourceItem.type {
                getResources(typeRequest: type)
            }
        }
    }
    
    func getResources(typeRequest: TypeOfItem) {
        
        
    }
}
