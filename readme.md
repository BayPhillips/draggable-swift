#Draggable-Swift

Utilizing Swift 2's protocol extensions, we're able to make any UIView backed class draggable easily by simply adding the `Draggable` protocol, implementing one property and enabling the gestures:

##Example

    class DraggableView: UIView, Draggable
    {
        var initialLocation: CGPoint = CGPointZero
    
        override func didMoveToSuperview() {
            if self.superview != nil {
                self.registerDraggability()
            } else {
                self.removeDraggability()
            }
        }
    }

The demo also includes an example for `UICollectionViewCell`, but this can be applied pretty much anywhere else.

##Screenshots
![Gif](http://bayphillips.com/wp-content/uploads/2015/10/boxdrag.gif)
![Gif](http://bayphillips.com/wp-content/uploads/2015/10/celldrag.gif)