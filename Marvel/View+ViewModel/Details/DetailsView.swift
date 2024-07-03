//
//  DetailsView.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 3/7/24.
//

import SwiftUI

struct DetailsView: View {

    @StateObject var viewModel: DetailsViewModel
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: viewModel.resourceItem.thumbnailSTR)) { image in
                image.resizable()
                    .frame(width: 190, height: 250)
            } placeholder: {
                ProgressView()
                    .frame(width: 190, height: 250)
            }
            
            Text(viewModel.resourceItem.title)
                .font(.title)
                .bold()
            
            Text(viewModel.resourceItem.description)
                .font(.body)
                .multilineTextAlignment(.leading)
            
            
            ListItem(resourcesList: $viewModel.resourcesList)

            
        }.padding()

    }
}

#Preview {
    DetailsView(viewModel: DetailsViewModel(                                    ResourceItem(Character(id: 1, name: "3D - Man", description: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: "jpg"))))
    )
}
