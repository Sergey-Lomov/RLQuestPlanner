//
//  Character+CoreDataProperties.swift
//  QuestPlaner
//
//  Created by Serhii.Lomov on 1/19/20.
//  Copyright © 2020 Serhii.Lomov. All rights reserved.
//
//

import Foundation
import CoreData


extension Character {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Character> {
        return NSFetchRequest<Character>(entityName: "Character")
    }

    @NSManaged public var initialElements: NSSet?

}

// MARK: Generated accessors for initialElements
extension Character {

    @objc(addInitialElementsObject:)
    @NSManaged public func addToInitialElements(_ value: StoryElement)

    @objc(removeInitialElementsObject:)
    @NSManaged public func removeFromInitialElements(_ value: StoryElement)

    @objc(addInitialElements:)
    @NSManaged public func addToInitialElements(_ values: NSSet)

    @objc(removeInitialElements:)
    @NSManaged public func removeFromInitialElements(_ values: NSSet)

}
