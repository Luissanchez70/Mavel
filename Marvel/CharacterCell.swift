//
//  CharacterCell.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 2/7/24.
//

import SwiftUI

struct CharacterCell: View {
    
    var character: Character
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: ("\(character.thumbnail.path).jpg"))) { image in
                image.resizable().frame(width: 50, height: 50)
            } placeholder: {
                ProgressView().frame(width: 50, height: 50)
            }
            VStack(alignment: .leading) {
                Text(character.name)
                Text(character.description).lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            }
        }.padding(10)
    }
}

#Preview {
    CharacterCell(character: Character(id: 1, name: "A-Bomb (HAS)4", description: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: "jpg"))).previewLayout(.fixed(width: 300, height: 50))
}
