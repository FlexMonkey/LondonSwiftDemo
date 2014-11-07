//
//  SavedColorsGrid.swift
//  LondonSwiftDemoApp
//
//  Created by Simon Gladman on 03/11/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import UIKit

class SavedColorsGrid: Panel, UICollectionViewDataSource, UICollectionViewDelegate
{
    let uiCollectionView: UICollectionView
    let layout = UICollectionViewFlowLayout()
    private var selectedColor: UIColor?
    
    override init(frame: CGRect)
    {
        layout.scrollDirection = .Vertical
        
        uiCollectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        uiCollectionView.registerClass(NamedColorItemRenderer.self, forCellWithReuseIdentifier: "Cell")
        uiCollectionView.allowsSelection = true
        
        super.init(frame: frame)
        
        uiCollectionView.dataSource = self
        uiCollectionView.delegate = self
        
        uiCollectionView.backgroundColor = UIColor.clearColor()

        addSubview(uiCollectionView)
    }
    
    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    var colors: [NamedColor] = [NamedColor]()
    {
        didSet
        {
            uiCollectionView.reloadData()
        }
    }
    
    func getSelectedColor() -> UIColor
    {
        return selectedColor!
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return colors.count
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        selectedColor = colors[indexPath.item].color
        
        sendActionsForControlEvents(UIControlEvents.ValueChanged)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as NamedColorItemRenderer
        
        cell.hasBackground = true
        cell.namedColor = colors[indexPath.item]
        
        return cell
    }
    
    override func didMoveToSuperview()
    {
        addSubview(uiCollectionView)
    }
    
    override func layoutSubviews()
    {
        layout.itemSize = CGSize(width: frame.width - 10, height: 50)
        
        uiCollectionView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height).rectByInsetting(dx: 5, dy: 5)
    }
    
}
