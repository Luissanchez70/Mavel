//
//  ListCell.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 3/7/24.
//

import SwiftUI

struct ListCell: View {
    var resorceItem: ResourceItem
    var body: some View {
        HStack {
            
            AsyncImage(url: URL(string: resorceItem.thumbnailSTR)) { image in
                image.resizable()
                    .frame(width: 50, height: 70)
            } placeholder: {
                ProgressView()
                    .frame(width: 50, height: 70)
            }
            VStack(alignment: .leading, spacing: 10) {
                Text(resorceItem.title)
                    .font(.system(size: 15))
                    .bold()
                    .lineLimit(1)
                Text(resorceItem.description)
                    .font(.system(size: 11))
                    .lineLimit(3)
            }
        }.frame(height: 70)
    }
}

#Preview {
    ListCell( resorceItem: ResourceItem(Character(id: 1, name: "3D - Man", description: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: "jpg")))
    )
}
