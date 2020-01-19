//
//  Abstraction+CoreDataProperties.swift
//  QuestPlaner
//
//  Created by Serhii.Lomov on 1/19/20.
//  Copyright © 2020 Serhii.Lomov. All rights reserved.
//
//

import Foundation
import CoreData


extension Abstraction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Abstraction> {
        return NSFetchRequest<Abstraction>(entityName: "Abstraction")
    }

    @NSManaged public var info: String?
    @NSManaged public var title: String?
    @NSManaged public var id: UUID?

}
