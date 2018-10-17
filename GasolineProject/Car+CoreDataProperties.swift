//
//  Car+CoreDataProperties.swift
//  GasolineProject
//
//  Created by Andre Faruolo on 17/10/18.
//  Copyright © 2018 Andre Faruolo. All rights reserved.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var id: NSObject?
    @NSManaged public var gasolineAut: NSObject?
    @NSManaged public var etanolAut: NSObject?
    @NSManaged public var make: NSObject?
    @NSManaged public var model: NSObject?

}
