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
        
        redWidget.layer.backgroundColor = UIColor.redColor().CGColor
                greenWidget.layer.backgroundColor = UIColor.greenColor().CGColor
                blueWidget.layer.backgroundColor = UIColor.blueColor().CGColor
    }
    
    override func layoutSubviews()
    {
        let widgetHeight = frame.height / 3
        
        redWidget.frame = CGRect(x: 0, y: 0, width: frame.width, height: widgetHeight).rectByInsetting(dx: 2, dy: 2)
        greenWidget.frame = CGRect(x: 0, y: widgetHeight, width: frame.width, height: widgetHeight).rectByInsetting(dx: 2, dy: 2)
        blueWidget.frame = CGRect(x: 0, y: widgetHeight * 2, width: frame.width, height: widgetHeight).rectByInsetting(dx: 2, dy: 2)
    }
    
}
