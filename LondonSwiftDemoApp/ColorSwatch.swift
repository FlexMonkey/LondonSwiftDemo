//
//  ColorSwatch.swift
//  LondonSwiftDemoApp
//
//  Created by Simon Gladman on 03/11/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import UIKit

class ColorSwatch: UIControl {
    
    override func didMoveToSuperview()
    {
        layer.backgroundColor = UIColor.greenColor().CGColor
        
        let label = UILabel()
        label.text = "ColorPicker"
        
        addSubview(label)
    }
    
    override func layoutSubviews()
    {
        println("ColorSwatch: layoutSubviews")
    }
    
}
