//
//  GamesModel.swift
//  Games List
//
//  Created by Irfan Fauzan R on 03/12/20.
//  Copyright © 2020 Irfan Fauzan R. All rights reserved.
//

import Foundation
import Combine
import SwiftyJSON

class APIServices : ObservableObject {
    @Published var data = [Games]()
    
    init() {
        let url = "https://api.rawg.io/api/games"
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) {(data,_,err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            
            let json = try! JSON(data:data!)
            let items = json["results"].array!
            
            for i in items {
                let ID = i["id"].intValue
                let Name = i["name"].stringValue
                let Released = i["released"].stringValue
                let BackgroundImage = i["background_image"].stringValue
                let Rating = i["rating"].stringValue
            
                DispatchQueue.main.async {
                self.data.append(Games(id: ID, name: Name, released: Released, background_image: BackgroundImage, rating: Rating))
                }
                
            }
        }.resume()
    }
}
