//
//  ListItem.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 3/7/24.
//

import SwiftUI

struct ListItem: View {
    
    @Binding var resourcesList: [TypeOfItem: [ResourceItem]]
    @State var selectedResource: TypeOfItem = .comics
    
    var body: some View {
        VStack {
    
            Picker("Resources", selection: $selectedResource) {
                ForEach(Array(resourcesList.keys), id: \.self) { key in
                    Text("\(key)")
                }
            }.pickerStyle(.segmented)
            
            List {
                if let indices = resourcesList[selectedResource]?.indices {
                    ForEach(indices, id: \.self) { index in
                        ListCell(resorceItem: resourcesList[selectedResource]![index])
                            .listRowInsets(EdgeInsets())
                    }
                } else {
                    Text("Not Found")
                }
               
            }.listStyle(PlainListStyle())
            
        }
    }
}

#Preview {
    ListItem(resourcesList: .constant(
            [.comics: [ResourceItem(Comic(id: 1, title: "Uno", description: "Without Description", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: "jpg")))
                      ],
             .characters :[ResourceItem(Comic(id: 1, title: "dos", description: "Without Description", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: "jpg")))
                          ]
            ]
        )
    )
}
