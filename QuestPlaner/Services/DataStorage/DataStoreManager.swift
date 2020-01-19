//
//  DataStoreManager.swift
//  QuestPlaner
//
//  Created by Serhii.Lomov on 1/19/20.
//  Copyright © 2020 Serhii.Lomov. All rights reserved.
//

import Foundation
import CoreData
import AppKit

class DataStoreManager: NSObject {
//    enum Entity: String {
//        case abstraction = "Abstraction"
//        case character = "Character"
//        case ingameEntity = "IngameEntity"
//        case storyElement = "StoryElement"
//    }
    
    var container: NSPersistentContainer
    var context: NSManagedObjectContext {return container.viewContext}
    
    static var shared = DataStoreManager()
    
    override init() {
        container = (NSApplication.shared.delegate as! AppDelegate).persistentContainer
    }
    
    // MARK: - Public
    func addAbstraction(title: String, info: String) {
        guard let abstraction: Abstraction = newObject() else { return }
        abstraction.id = UUID()
        abstraction.title = title
        abstraction.info = info
    }
    
    func addCharacter(title: String, info: String, ingameInfo: String, initialElements:Set<StoryElement> = Set<StoryElement>()) {
        guard let character: Character = newObject() else { return }
        character.id = UUID()
        character.title = title
        character.info = info
        character.ingamerInfo = ingameInfo
        character.initialElements = (initialElements as NSSet)
    }
    
    func addStoryElement(title: String, info: String, ingameInfo: String, initialOwner: Character? = nil) {
        guard let element: StoryElement = newObject() else { return }
        element.id = UUID()
        element.title = title
        element.info = info
        element.ingamerInfo = ingameInfo
        element.initialOwner = initialOwner
    }
    
    func all<T: NSManagedObject>() -> [T] {
        guard let entityName = T.entity().name else { return [] }
        let request = NSFetchRequest<T>(entityName: entityName)
        guard let result = try? context.fetch(request) else { return []}
        return result
    }
    
    func object<T: Abstraction>(byId id: String) -> T? {
        guard let entityName = T.entity().name else { return nil }
        let request = NSFetchRequest<T>(entityName: entityName)
        request.predicate = NSPredicate(format: "id == \(id)")
        return try? context.fetch(request).first 
    }
    
    func save() {
        if !context.commitEditing() {
            NSLog("\(NSStringFromClass(type(of: self))) unable to commit editing before saving")
        }
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                NSApplication.shared.presentError(nserror)
            }
        }
    }
    
    // MARK: - Private
    private func newObject<T: NSManagedObject>() -> T? {
        guard let entityName = T.entity().name else { return nil }
        let object = NSEntityDescription.insertNewObject(forEntityName: entityName,
                                                         into: container.viewContext)
        return object as? T
    }
}
