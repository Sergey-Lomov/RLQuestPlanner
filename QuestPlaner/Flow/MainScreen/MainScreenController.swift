//
//  MainScreenController.swift
//  QuestPlaner
//
//  Created by Serhii.Lomov on 1/18/20.
//  Copyright © 2020 Serhii.Lomov. All rights reserved.
//

import Cocoa

class MainScreenController: NSViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var projectNavigator: NSOutlineView!
    
    var projectNavigatorPresenter = ProjectNavigatorPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let abstractions: [Abstraction] = DataStoreManager.shared.all()
        if abstractions.count == 0 {
            DataStoreManager.shared.addAbstraction(title: "TA 1", info: "TAi 1")
            DataStoreManager.shared.addAbstraction(title: "TA 2", info: "TAi 2")
            DataStoreManager.shared.addAbstraction(title: "TA 3", info: "TAi 3")
            DataStoreManager.shared.addCharacter(title: "CH 1", info: "CHi 1", ingameInfo: "CHii 1")
        }
        
        projectNavigatorPresenter.outlineView = projectNavigator
        projectNavigatorPresenter.reloadData()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

