//
//  ColorSwatch.swift
//  LondonSwiftDemoApp
//
//  Created by Simon Gladman on 03/11/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import UIKit

class ColorSwatch: Panel
{
    var currentColor:UIColor = UIColor.blackColor()
    {
        didSet
        {
            layer.backgroundColor = currentColor.CGColor
        }
    }
    
    override func didMoveToSuperview()
    {
    }
    
    override func layoutSubviews()
    {

    }
    
}
