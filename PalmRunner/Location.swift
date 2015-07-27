//
//  Location.swift
//  PalmRunner
//
//  Created by Ho Daniel on 8/5/15.
//  Copyright (c) 2015 rm-3d.com. All rights reserved.
//

import Foundation
import CoreData

class Location: NSManagedObject {

    @NSManaged var latitude: NSNumber
    @NSManaged var longitude: NSNumber
    @NSManaged var timestamp: NSDate
    @NSManaged var run: Run

}
