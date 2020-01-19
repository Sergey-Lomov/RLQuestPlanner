//
//  ProjectNavigatorRepository.swift
//  QuestPlaner
//
//  Created by Serhii.Lomov on 1/19/20.
//  Copyright © 2020 Serhii.Lomov. All rights reserved.
//

import Foundation

class ProjectNavigatorRepository: NSObject {

    let typeTitle = [Abstraction.classId: NSLocalizedString("Abstractions", comment: ""),
                     Character.classId: NSLocalizedString("Characters", comment: ""),
                     StoryElement.classId: NSLocalizedString("Story elements", comment: "")]

    func getAllItems() -> [ProjectNabigatorViewModel] {
        var groups = [Abstraction.classId: groupFor(Abstraction.classId),
                      Character.classId: groupFor(Character.classId),
                      StoryElement.classId: groupFor(StoryElement.classId)]
        
        for abstraction: Abstraction in DataStoreManager.shared.all() {
            let item = ProjectNabigatorViewModel(id: abstraction.id, title: abstraction.title)
            groups[abstraction.classId]?.childs.append(item)
        }
        
        return groups.values.filter {!$0.childs.isEmpty}
    }
    
    private func groupFor(_ type:ObjectIdentifier) -> ProjectNabigatorViewModel {
        return ProjectNabigatorViewModel(id: nil, title: typeTitle[type])
    }
}
