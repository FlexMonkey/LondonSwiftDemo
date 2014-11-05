//
//  Panel.swift
//  LondonSwiftDemoApp
//
//  Created by Simon Gladman on 04/11/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import UIKit

class Panel: UIControl
{

    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        layer.backgroundColor = UIColor.lightGrayColor().CGColor
        
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 0.5
        
        layer.cornerRadius = 5
        layer.borderColor = UIColor.darkGrayColor().CGColor
        layer.borderWidth = 1
        
        layer.cornerRadius = 5
    }

    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
