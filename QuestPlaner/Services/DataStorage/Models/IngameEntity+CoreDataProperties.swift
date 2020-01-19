//
//  IngameEntity+CoreDataProperties.swift
//  QuestPlaner
//
//  Created by Serhii.Lomov on 1/19/20.
//  Copyright © 2020 Serhii.Lomov. All rights reserved.
//
//

import Foundation
import CoreData


extension IngameEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<IngameEntity> {
        return NSFetchRequest<IngameEntity>(entityName: "IngameEntity")
    }

    @NSManaged public var ingamerInfo: String?

}
