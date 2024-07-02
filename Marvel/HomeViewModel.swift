//
//  HomeViewModel.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 2/7/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    private var getCharacterUseCase = GetCharacterUseCase()
    private var getComicsUseCase = GetComicsUseCase()
    var cancellable: Set<AnyCancellable> = []
    @Published var listOfChracters: [Character] = []
    @Published var listOfComics: [Comic] = []
    
    init() {
        getCharacters()
        getComics()
    }
    
    func getCharacters() {
        
        getCharacterUseCase.execute().sink { completion in
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
        }.store(in: &cancellable)

    }
    
    func getComics() {
        
        getComicsUseCase.execute().sink { completion in
            switch completion {
            case .finished:
                return
            case .failure(let error):
                print("2 --> Error \(error)")
            }
        } receiveValue: { listOfComics in
            
            if !listOfComics.isEmpty {
                DispatchQueue.main.async {
                    self.listOfComics = listOfComics
                }
            }
        }.store(in: &cancellable)

    }
}
