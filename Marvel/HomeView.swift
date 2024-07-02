//
//  ContentView.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 1/7/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    var rows = [GridItem(.flexible())]
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                Text("Characters")
                ScrollView(.horizontal) {
                    LazyHGrid(rows: rows, spacing: 16){
                        ForEach(viewModel.listOfChracters, id: \.id) { character in
                            CharacterCell(character: character)
                        }
                    }.frame(maxHeight: 220)
                }
                Text("Comics")
                ScrollView(.horizontal) {
                    LazyHGrid(rows: rows, spacing: 16){
                        ForEach(viewModel.listOfComics, id: \.id) { comic in
                            CharacterCell(comic: comic)
                        }
                    }.frame(maxHeight: 220)
                }
            }.padding()

        }
                    
    }
}

#Preview {
    HomeView()
}
  
