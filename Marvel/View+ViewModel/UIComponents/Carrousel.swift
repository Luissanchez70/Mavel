//
//  Carrousel.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 2/7/24.
//

import SwiftUI

struct Carrousel: View {
    
    var listOfChracters: [Character]
    @State var currentIndext: Int = 0
    @State var timer: Timer?
    
    var body: some View {
        
        ScrollView(.horizontal) {
            ScrollViewReader { scrollViewProxy in
                LazyHGrid(rows: [GridItem(.flexible())], spacing: 16){
                    ForEach(listOfChracters.indices, id: \.self) { index in
                        CharacterCell(character: listOfChracters[index])
                            .id(index)
                    }
                }
                .frame(maxHeight: 220)
                .onAppear {
                    startTimer(scrollViewProxy)
                }
                .onDisappear {
                    stopTimer()
                }
            }
        }
    }
    
    
    func startTimer(_ scrollViewProxy: ScrollViewProxy) {
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
            withAnimation {
                if listOfChracters.count > 0 {
                    currentIndext = (currentIndext + 2) % listOfChracters.count
                    scrollViewProxy.scrollTo(currentIndext, anchor: .center)
                }
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil

    }
}

#Preview {
    Carrousel(listOfChracters: [
        Character(id: 1, name: "uno", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: "jpg")),
        Character(id: 1, name: "dos", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: "jpg")),
        Character(id: 1, name: "tres", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: "jpg")),
        Character(id: 1, name: "cuatro", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: "jpg"))])
}
