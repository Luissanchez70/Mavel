//
//  CharacterCell.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 2/7/24.
//

import SwiftUI

struct ResourceItemCell: View {
    
    var thumbnailURL: String
    var title: String
    var description: String
    
    init(resourceItem: ResourceItem) {
        self.thumbnailURL = resourceItem.thumbnailSTR
        self.title = resourceItem.title
        self.description = resourceItem.description
    }

    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: URL(string: thumbnailURL)) { image in
                image.resizable().frame(width: 130, height: 150)
            } placeholder: {
                ProgressView().frame(width: 130, height: 150)
            }
        
            Spacer()
    
            Text(title)
                .font(.system(size: 11, weight: .bold))
                .bold()
                .lineLimit(1)
                .padding()
         
            
        }.frame(width: 130, height: 200)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .shadow(radius: 5)
    }
}

#Preview {
    ResourceItemCell(resourceItem: ResourceItem(
        Character(id: 1, name: "A-Bomb (HAS)4", description: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: "jpg"))
    )
    )
}
