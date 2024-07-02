//
//  HomeViewModel.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 2/7/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    var getCharacterUseCase = GetCharacterUseCase()
    var cancellable: AnyCancellable?
    @Published var listOfChracters: [Character] = []
    
    init() {
        getCharacters()
    }
    
    func getCharacters() {
        
        cancellable = getCharacterUseCase.execute().sink { completion in
            switch completion {
            case .finished:
                return
            case .failure(let error):
                print("1 --> Error \(error.localizedDescription)")
            }
        } receiveValue: { listOfCharacters in
            
            if !listOfCharacters.isEmpty {
                DispatchQueue.main.async {
                    self.listOfChracters = listOfCharacters
                }
            }
        }

    }
}
