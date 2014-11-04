//
//  RGBWidget.swift
//  LondonSwiftDemoApp
//
//  Created by Simon Gladman on 03/11/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import UIKit

class RGBWidget: UIControl {
    
    override func didMoveToSuperview()
    {
        layer.backgroundColor = UIColor.blueColor().CGColor
        
        let label = UILabel()
        label.text = "RGBWidget"
        
        addSubview(label)
    }
    
    override func layoutSubviews()
    {
        println("RGBWidget: layoutSubviews")
    }
    
}
