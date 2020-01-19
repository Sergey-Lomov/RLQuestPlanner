//
//  ProjectNavigatorPresenter.swift
//  QuestPlaner
//
//  Created by Serhii.Lomov on 1/19/20.
//  Copyright © 2020 Serhii.Lomov. All rights reserved.
//

import Cocoa

class ProjectNavigatorPresenter : NSObject, NSOutlineViewDelegate, NSOutlineViewDataSource {
    enum CellId : String {
        case abstract = "AbstractEntityCell"
        
        var id: NSUserInterfaceItemIdentifier {return NSUserInterfaceItemIdentifier(rawValue: self.rawValue)}
    }
    
    var outlineView: NSOutlineView? {
        didSet {
            outlineView?.delegate = self
            outlineView?.dataSource = self
        }
    }
    
    private var repository: ProjectNavigatorRepository = ProjectNavigatorRepository()
    private var models = [ProjectNabigatorViewModel]()
    
    func reloadData() {
        models = repository.getAllItems()
        outlineView?.reloadData()
    }
    
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        guard item != nil else { return models.count }
        guard let model = item as? ProjectNabigatorViewModel else { return 0 }
        return model.childs.count
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        guard let model = item as? ProjectNabigatorViewModel else { return false }
        return !model.childs.isEmpty
    }
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        guard let model = item as? ProjectNabigatorViewModel else { return models[index] }
        return model.childs[index]
    }
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        guard let cell = outlineView.makeView(withIdentifier: CellId.abstract.id, owner: nil),
            let abstractCell = cell as? EntityTableCell,
            let item = item as? ProjectNabigatorViewModel else { return nil }
        abstractCell.textField?.stringValue = item.title ?? "Undefined"
        return abstractCell
    }
}
