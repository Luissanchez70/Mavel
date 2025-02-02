//
//  ContentView.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 1/7/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
 
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                Text("Characters").font(.title)
                Carrousel(listOfItem: $viewModel.listOfChracters)
                Text("Comics").font(.title)
                Carrousel(listOfItem: $viewModel.listOfComics)
                Spacer()
            }.padding()

        }
                    
    }
}

#Preview {
    HomeView()
}
  
