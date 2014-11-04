//
//  ColorPicker.swift
//  LondonSwiftDemoApp
//
//  Created by Simon Gladman on 03/11/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import UIKit

class ColorPicker: UIControl {

    override func didMoveToSuperview()
    {
        layer.backgroundColor = UIColor.redColor().CGColor
        
        let label = UILabel()
        label.text = "ColorPicker"

        addSubview(label)
    }

    override func layoutSubviews()
    {
        println("ColorPicker: layoutSubviews")
    }
    
}
