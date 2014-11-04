//
//  SliderWidget.swift
//  LondonSwiftDemoApp
//
//  Created by Simon Gladman on 04/11/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import UIKit

class SliderWidget: UIControl
{

    let slider = UISlider(frame: CGRectZero)
    let label = UILabel(frame: CGRectZero)
    
    override func didMoveToSuperview()
    {
        label.text = "Xyz"
        
        layer.cornerRadius = 5
        
        addSubview(slider)
        addSubview(label)
    }
    
    override func layoutSubviews()
    {
        label.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        slider.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
    }

}
