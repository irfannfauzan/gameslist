//
//  ContentView.swift
//  Games List
//
//  Created by Irfan Fauzan R on 03/12/20.
//  Copyright © 2020 Irfan Fauzan R. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        TabView{
        Viewers()
            .tabItem{
                Image(systemName: "gamecontroller.fill")
                Text("List")
                }
                FavoritesView()
                .tabItem{
            Image(systemName: "heart.fill")
                           Text("Favourites!")
                }
                About()
                    .tabItem{
                    Image(systemName: "person.circle.fill")
                    Text("Profile")
                }
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Viewers : View {
    
    @ObservedObject var Gamess = APIServices()
    var body : some View {
        NavigationView{
        List(Gamess.data) { i in
            NavigationLink(destination : Detail(Game1: i)) {
            HStack{
                if i.background_image != "" {
                    WebImage(url: URL(string: i.background_image)!)
                    .resizable()
                        .frame(width: 120, height: 120, alignment: .leading)
                    .cornerRadius(5)
                    
                }
                else {
                    Image("loader").resizable().frame(width: 80, height: 100, alignment: .leading)
                }
                    VStack(alignment:.leading, spacing:10) {
                    Text(i.name).font(.system(.headline))
                        .fontWeight(.bold)
                        HStack{
                    Image(systemName: "star.fill")
                                   .imageScale(.small)
                                   .foregroundColor(.yellow)
                    Text("Rating : \(i.rating)").font(.subheadline)
                        }
                    Text("Released Date : \(i.released)").font(.subheadline)
                    
                }
                }
            }.navigationBarTitle("Games")
    }
    }
    }
}

struct About: View {
    var body: some View {
        NavigationView{
        VStack{
            Image("irfans").resizable().frame(width: 300, height: 300).aspectRatio(contentMode: .fit)

            VStack{
                Text("Nama : Irfan Fauzan Rachman")
                Text("Email : Irfanfauzanrachman@gmail.com")
                .navigationBarTitle("Profile")
            }
        }
}
}
}
