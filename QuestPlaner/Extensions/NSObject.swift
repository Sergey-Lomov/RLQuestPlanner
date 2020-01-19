//
//  NSObject.swift
//  QuestPlaner
//
//  Created by Serhii.Lomov on 1/19/20.
//  Copyright © 2020 Serhii.Lomov. All rights reserved.
//

import Foundation

extension NSObject {
    class var classId: ObjectIdentifier {
        return ObjectIdentifier(self)
    }
    
    var classId: ObjectIdentifier {
        return type(of: self).classId
    }
}
