//
//  Draggable+UIGestureRecognizer.swift
//  DraggableTest
//
//  Created by Bay Phillips on 9/27/15.
//  Copyright © 2015 Bay Phillips. All rights reserved.
//

import UIKit

extension UIGestureRecognizer {
    private class ClosureWrapper: NSObject {
        
        static var gestureMapping = NSMapTable.weakToStrongObjectsMapTable()
        
        let handler: (UIGestureRecognizer) -> Void
        
        init(handler: (UIGestureRecognizer) -> Void) {
            self.handler = handler
        }
    }
    
    class GestureDelegate: NSObject, UIGestureRecognizerDelegate {
        static var delegateKey: String = "delegateKey"
        @objc func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            return gestureRecognizer.delegate is GestureDelegate && otherGestureRecognizer.delegate is GestureDelegate
        }
        
        @objc func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
            return true
        }
        
        @objc func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
            return true
        }
    }
    
    private var multiDelegate: GestureDelegate {
        get {
            return objc_getAssociatedObject(self, &GestureDelegate.delegateKey) as! GestureDelegate
        }
        set {
            objc_setAssociatedObject(self, &GestureDelegate.delegateKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var handler: (UIGestureRecognizer) -> Void {
        get {
            if let closureWrapper = ClosureWrapper.gestureMapping.objectForKey(self) as? ClosureWrapper {
                return closureWrapper.handler
            } else {
                fatalError("Couldn't find mapping")
            }
        }
        set {
            self.addTarget(self, action: #selector(handleAction))
            self.multiDelegate = GestureDelegate()
            self.delegate = self.multiDelegate
            ClosureWrapper.gestureMapping.setObject(ClosureWrapper(handler: newValue), forKey: self)
        }
    }
    
    func handleAction() {
        self.handler(self)
    }
}