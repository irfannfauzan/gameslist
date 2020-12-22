//
//  FavoritesView.swift
//  Games List
//
//  Created by Irfan Fauzan R on 16/12/20.
//  Copyright © 2020 Irfan Fauzan R. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavoritesView: View {
    @Environment(\.managedObjectContext) var managedContext
    @FetchRequest(entity: CoreData.entity(), sortDescriptors: []) var coredata : FetchedResults<CoreData>
    var body: some View {
        NavigationView{
        List{
        ForEach(coredata, id:\.self) { game in
            NavigationLink(
                destination :
                    Detail(Game1:
                            Games(
                                id: game.id,
                                name: game.name,
                                released: game.released,
                                background_image: game.background_image,
                                rating: game.rating
                            )
                    )
            ) {
                VStack{
                    WebImage(url: URL(string: game.background_image)!)
                        .resizable()
                        .frame(width: 120, height: 120, alignment: .leading)
                                         .cornerRadius(5)
                    Text("\(game.name)")
                    HStack{
                        Text("Rating : \(game.rating)")
                    }
                    Text("Released : \(game.released)")
                }
            }}.onDelete(perform: removeList)
            }.navigationBarTitle("Favourite List")
        }
    }
    func removeList(at offsets: IndexSet) {
        for index in offsets {
            let delete = coredata[index]
            managedContext.delete(delete)
        }
        do {
        try managedContext.save()
        } catch {print("error")}
    }
    }

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}

