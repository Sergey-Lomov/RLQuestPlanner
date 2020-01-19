//
//  StoryElement+CoreDataProperties.swift
//  QuestPlaner
//
//  Created by Serhii.Lomov on 1/19/20.
//  Copyright © 2020 Serhii.Lomov. All rights reserved.
//
//

import Foundation
import CoreData


extension StoryElement {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StoryElement> {
        return NSFetchRequest<StoryElement>(entityName: "StoryElement")
    }

    @NSManaged public var initialOwner: Character?

}
