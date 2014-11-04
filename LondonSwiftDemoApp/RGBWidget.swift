//
//  RGBWidget.swift
//  LondonSwiftDemoApp
//
//  Created by Simon Gladman on 03/11/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import UIKit

class RGBWidget: Panel
{
 
    let redWidget = SliderWidget(frame: CGRectZero)
    let greenWidget = SliderWidget(frame: CGRectZero)
    let blueWidget = SliderWidget(frame: CGRectZero)
    
    override func didMoveToSuperview()
    {
        addSubview(redWidget)
        addSubview(greenWidget)
        addSubview(blueWidget)
        
        redWidget.title = "Red"
        greenWidget.title = "Green"
        blueWidget.title = "Blue"
    }
    
    private var redComponent: Float = 0
    {
        didSet
        {
            redWidget.value = redComponent
        }
    }
    
    private var greenComponent: Float = 0
    {
        didSet
        {
            greenWidget.value = greenComponent
        }
    }
    
    private var blueComponent: Float = 0
    {
        didSet
        {
            blueWidget.value = blueComponent
        }
    }
    
    var currentColor: UIColor = UIColor.blackColor()
    {
        didSet
        {
            let colorRef = CGColorGetComponents(currentColor.CGColor);
            
            redComponent = Float(colorRef[0])
            greenComponent = Float(colorRef[1])
            blueComponent = Float(colorRef[2])
        }
    }
    
    override func layoutSubviews()
    {
        let widgetHeight = frame.height / 3
        let margin = CGFloat(6)
        
        redWidget.frame = CGRect(x: 0, y: 0, width: frame.width, height: widgetHeight).rectByInsetting(dx: margin, dy: margin)
        greenWidget.frame = CGRect(x: 0, y: widgetHeight, width: frame.width, height: widgetHeight).rectByInsetting(dx: margin, dy: margin)
        blueWidget.frame = CGRect(x: 0, y: widgetHeight * 2, width: frame.width, height: widgetHeight).rectByInsetting(dx: margin, dy: margin)
    }
    
}
