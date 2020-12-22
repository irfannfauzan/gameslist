//
//  Detail.swift
//  Games List
//
//  Created by Irfan Fauzan R on 04/12/20.
//  Copyright © 2020 Irfan Fauzan R. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import CoreData

struct Detail: View {
    @Environment(\.managedObjectContext) var managedContext
    var Game1 : Games
    
    var body: some View {
        
        VStack{
            WebImage(url: URL(string: Game1.background_image)!).resizable()
                .frame(width:400, height: 400)

                .aspectRatio(contentMode: .fit)
            VStack{
                Text(Game1.name).font(.headline).bold()
            HStack{
                Text("Released : \(Game1.released)").font(.subheadline)
                }
                HStack{
                Image(systemName: "star.fill")
                .imageScale(.small)
                .foregroundColor(.yellow)
                Text("Rating : \(Game1.rating)").font(.subheadline)
                    .navigationBarTitle("Details")
                    }
                HStack{
                    Button(action :{
                        var gamesCoreData: [CoreData]?
                        let request = CoreData.fetchRequest()
                        request.predicate = NSPredicate(
                            format: "id = %d",
                            self.Game1.id
                        )
                        do{
                            gamesCoreData = try self.managedContext.fetch(request) as? [CoreData]
                        }catch {}

                        guard let games = gamesCoreData else { return }
                        if games.isEmpty {
                            let newName = CoreData(context: self.managedContext)
                            newName.id = self.Game1.id
                            newName.name = self.Game1.name
                            newName.rating = self.Game1.rating
                            newName.released = self.Game1.released
                            newName.background_image = self.Game1.background_image
                            try? self.managedContext.save()
                        } else {
                            guard let deletedGame = games.first else { return }
                            self.managedContext.delete(deletedGame)
                            try? self.managedContext.save()
                        }
                       },
                              label: {
                                Image(systemName: "heart")
                                    .foregroundColor(.red)
                       }

                   )
                }
            }
            }
            }
        
           }
