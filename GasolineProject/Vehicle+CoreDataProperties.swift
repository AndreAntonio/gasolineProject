//
//  Vehicle+CoreDataProperties.swift
//  GasolineProject
//
//  Created by Andre Faruolo on 17/10/18.
//  Copyright © 2018 Andre Faruolo. All rights reserved.
//
//

import Foundation
import CoreData


extension Vehicle {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Vehicle> {
        return NSFetchRequest<Vehicle>(entityName: "Vehicle")
    }

    @NSManaged public var etanolAut: Double
    @NSManaged public var gasAut: Double
    @NSManaged public var id: Float
    @NSManaged public var make: String?
    @NSManaged public var model: String?

}
