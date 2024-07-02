//
//  ContentView.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 1/7/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    @State var currentIndext: Int = 0
    @State var timer: Timer?
    
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                Text("Characters").font(.title)
                Carrousel(listOfChracters: viewModel.listOfChracters)
                Text("Comics").font(.title)
                ScrollView(.horizontal) {
                    LazyHGrid(rows: [GridItem(.flexible())], spacing: 16){
                        ForEach(viewModel.listOfComics, id: \.id) { comic in
                            CharacterCell(comic: comic)
                        }
                    }.frame(maxHeight: 220)
                }
                
                Spacer()
                
            }.padding()

        }
                    
    }
}

#Preview {
    HomeView()
}
  
