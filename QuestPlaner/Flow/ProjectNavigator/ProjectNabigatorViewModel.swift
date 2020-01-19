//
//  ProjectNavigatorViewModel.swift
//  QuestPlaner
//
//  Created by Serhii.Lomov on 1/19/20.
//  Copyright © 2020 Serhii.Lomov. All rights reserved.
//

import Foundation

struct ProjectNabigatorViewModel {
/*    enum ProjectNavigatorViewModelType {
        case abstraction
        case character
        case ingameEntity
        case storyElement
    }*/
    
    let id: UUID?
//    let type: ProjectNavigatorViewModelType
    let title: String?
    var childs = [ProjectNabigatorViewModel]()
}

