//
//  Games.swift
//  Games List
//
//  Created by Irfan Fauzan R on 03/12/20.
//  Copyright © 2020 Irfan Fauzan R. All rights reserved.
//

import Foundation
struct Games : Identifiable {
    var id : Int
    var name : String
    var released : String
    var background_image : String
    var rating : String
    
    enum CodingKeys : String,CodingKey {
        case id
        case name
        case released
        case backgroundImage = "background_image"
        case rating
    }
}

