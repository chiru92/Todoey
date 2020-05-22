//
//  Item.swift
//  Todoey
//
//  Created by Qrati Labs on 5/22/20.
//  Copyright © 2020 Qrati Labs. All rights reserved.
//

import Foundation

class Item {
    var title: String = ""
    var done: Bool = false
    
    init(title: String, done: Bool) {
        self.title = title
        self.done = done
    }
}
