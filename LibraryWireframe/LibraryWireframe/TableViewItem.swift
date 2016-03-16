//
//  TableViewItem.swift
//  LibraryWireframe
//
//  Created by Bill Howe on 3/13/16.
//  Copyright © 2016 Ian Howe. All rights reserved.
//

import Foundation

class TableViewItem {
    var labelName: String
    var link: String
    var isHeaderCell: Bool
    var isExpanded: Bool
    
    init(LabelName: String, Link: String) {
        labelName = LabelName
        link = Link
        isHeaderCell = false
        isExpanded = false
    }
    
    init(LabelName: String, Link: String, IsHeader: Bool) {
        labelName = LabelName
        link = Link
        isHeaderCell = true
        isExpanded = true
    }
    
    func toggleExpanded() {
        isExpanded = !isExpanded
    }
    
    
    
    
    
    
}