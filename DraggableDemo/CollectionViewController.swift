//
//  CollectionViewController.swift
//  DraggableTest
//
//  Created by Bay Phillips on 9/26/15.
//  Copyright © 2015 Bay Phillips. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(self.view.bounds.size.width, 200)
        
        self.collectionView?.setCollectionViewLayout(layout, animated: false)
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let draggableCell: DraggableCell = collectionView.dequeueReusableCellWithReuseIdentifier(DraggableCell.identifier, forIndexPath: indexPath) as! DraggableCell
        draggableCell.textLabel.text = "Row \(indexPath.row)"
        
        switch indexPath.row % 3 {
        case 0:
            draggableCell.backgroundColor = UIColor.blueColor()
            break
        case 1:
            draggableCell.backgroundColor = UIColor.purpleColor()
            break
        case 2:
            draggableCell.backgroundColor = UIColor.yellowColor()
            break
        default:
            break
        }
        return draggableCell
    }
}