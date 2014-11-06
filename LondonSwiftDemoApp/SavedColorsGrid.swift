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
    
    let colors = [
        NamedColor(name: "Custom", color: UIColor.clearColor()),
        NamedColor(name: "Red", color: UIColor.redColor()),
        NamedColor(name: "Green", color: UIColor.greenColor()),
        NamedColor(name: "Blue", color: UIColor.blueColor()),
        NamedColor(name: "Black", color: UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
        NamedColor(name: "Cyan", color: UIColor.cyanColor()),
        NamedColor(name: "Yellow", color: UIColor.yellowColor()),
        NamedColor(name: "Magenta", color: UIColor.magentaColor()),
        NamedColor(name: "Brown", color: UIColor.brownColor()),
        NamedColor(name: "Tomato", color: UIColor(red: 255/255, green: 99/255, blue: 71/255, alpha: 1)),
        NamedColor(name: "Salmon", color: UIColor(red: 250/255, green: 128/255, blue: 114/255, alpha: 1)),
        NamedColor(name: "Turquoise", color: UIColor(red: 64/255, green: 224/255, blue: 208/255, alpha: 1)),
        NamedColor(name: "Plum", color: UIColor(red: 221/255, green: 160/255, blue: 221/255, alpha: 1)),
        NamedColor(name: "Orchid", color: UIColor(red: 218/255, green: 112/255, blue: 214/255, alpha: 1)),
        NamedColor(name: "Wheat", color: UIColor(red: 245/255, green: 222/255, blue: 179/255, alpha: 1)),
        NamedColor(name: "Sienna", color: UIColor(red: 160/255, green: 82/255, blue: 45/255, alpha: 1))
    ]
    
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

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return colors.count
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        // currentColor = colors[indexPath.item]
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as NamedColorItemRenderer
        
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
