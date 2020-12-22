//
//  CoreData.swift
//  Games List
//
//  Created by Irfan Fauzan R on 16/12/20.
//  Copyright © 2020 Irfan Fauzan R. All rights reserved.
//

import CoreData
public class CoreData : NSManagedObject {
    @NSManaged var background_image : String
    @NSManaged var name : String
    @NSManaged var released : String
    @NSManaged var rating : String
    @NSManaged var id : Int
}
