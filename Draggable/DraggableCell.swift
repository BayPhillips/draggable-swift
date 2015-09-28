//
//  DraggableCell.swift
//  DraggableTest
//
//  Created by Bay Phillips on 9/27/15.
//  Copyright © 2015 Bay Phillips. All rights reserved.
//

import UIKit

class DraggableCell: UICollectionViewCell, Draggable {
    
    @IBOutlet weak var textLabel: UILabel!
    
    static let identifier: String = "draggablecell"
    
    var lastLocation: CGPoint = CGPointZero
    
    override func didMoveToSuperview() {
        if self.superview != nil {
            self.registerDraggability()
        } else {
            self.removeDraggability()
        }
    }
}