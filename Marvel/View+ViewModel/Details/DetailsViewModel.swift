//
//  DetailsViewModel.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 3/7/24.
//

import Foundation
import Combine

class DetailsViewModel: ObservableObject {

    var resourceItem: ResourceItem
    var listOfType: [TypeOfItem] =  [.comics, .characters, .events, .series]//, .stories, .creators]
    var cancellables: Set<AnyCancellable> = []
    @Published var resourcesList: [TypeOfItem: [ResourceItem]] = [:]
    
    init(_ resourceItem: ResourceItem) {
        self.resourceItem = resourceItem
        fecthResources()
    }
    
    
    func fecthResources() {
        
        for type in listOfType {
            if type != resourceItem.type {
                controlOfResource(type: type)
            }
        }
        print("Salio")
    }
    
    func controlOfResource(type: TypeOfItem) {
        
        switch type {
            
        case .characters:
            getResource(request: GetComicsUseCase(), type: type)
        case .comics:
            getResource(request: GetComicsUseCase(), type: type)
        case .events:
            getResource(request: GetEventUseCase(), type: type)
        case .series:
            getResource(request: GetSerieUseCase(), type: type)
        case .stories:
            getResource(request: GetComicsUseCase(), type: type)
        case .creators:
            getResource(request: GetComicsUseCase(), type: type)
        }
    }
    
    func getResource<Request: GetResourseProtocol>(request: Request, type: TypeOfItem ) {
        
        request.execute(baseResource: resourceItem.type, id: resourceItem.id, type: type).sink { completion in
            switch completion {
            case .finished:
                return
            case .failure(let error):
                print("3--> \(error.localizedDescription)")
            }
        } receiveValue: { list in
           
            DispatchQueue.main.async {
                if let list = list as? [Character] {
                    self.resourcesList[type] = list.map { ResourceItem($0) }
                } else if let list = list as? [Comic] {
                    print("entra en Comic")
                    self.resourcesList[type] = list.map { ResourceItem($0) }
                } else if let list = list as? [Serie] {
                    print("entra en serie")
                    self.resourcesList[type] = list.map { ResourceItem($0) }
                } else if let list = list as? [Event] {
                    print("entra en serie")
                    self.resourcesList[type] = list.map { ResourceItem($0) }
                }
            }
        }.store(in: &cancellables)

    }
    
    
}
