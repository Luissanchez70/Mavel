//
//  CharacterCell.swift
//  Marvel
//
//  Created by Luis Fernando Sanchez Muñoz on 2/7/24.
//

import SwiftUI

struct CharacterCell: View {
    
    var thumbnailURL: String
    var title: String
    var description: String
    
    init(character: Character) {
        self.thumbnailURL = character.thumbnail.path.replacingOccurrences(of: "http", with: "https") + "." + character.thumbnail.extension
        self.title = character.name
        self.description = character.description
    }
    
    init(comic: Comic) {
        self.thumbnailURL = comic.thumbnail.path.replacingOccurrences(of: "http", with: "https") + "." + comic.thumbnail.extension
        self.title = comic.title
        self.description = comic.description ?? "Without description"
    }
    
    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: URL(string: thumbnailURL)) { image in
                image.resizable().frame(width: 130, height: 150)
            } placeholder: {
                ProgressView().frame(width: 130, height: 150)
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 11, weight: .bold))
                    .lineLimit(1)
            }.padding()
            
        }.frame(width: 130, height: 200)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .shadow(radius: 5)
    }
}

#Preview {
    CharacterCell(character: Character(id: 1, name: "A-Bomb (HAS)4", description: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: "jpg")))
}
