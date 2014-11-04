//
//  SavedColorsGrid.swift
//  LondonSwiftDemoApp
//
//  Created by Simon Gladman on 03/11/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import UIKit

class SavedColorsGrid: UIControl {
    
    override func didMoveToSuperview()
    {
        layer.backgroundColor = UIColor.lightGrayColor().CGColor
        
        let label = UILabel()
        label.text = "SavedColorsGrid"
        
        addSubview(label)
    }
    
    override func layoutSubviews()
    {
        println("SavedColorsGrid: layoutSubviews")
    }
    
}
