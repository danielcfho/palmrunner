//
//  Run.swift
//  PalmRunner
//
//  Created by Ho Daniel on 8/5/15.
//  Copyright (c) 2015 rm-3d.com. All rights reserved.
//

import Foundation
import CoreData

class Run: NSManagedObject {

    @NSManaged var distance: NSNumber
    @NSManaged var duration: NSNumber
    @NSManaged var timestamp: NSDate
    @NSManaged var locations: NSOrderedSet

}
