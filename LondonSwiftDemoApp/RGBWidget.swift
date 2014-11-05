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
    var enableObserversOnColorComponents = true
    
    let redWidget: SliderWidget!
    let greenWidget: SliderWidget!
    let blueWidget: SliderWidget!
    
    let widgets: [SliderWidget]!
    let widgetTitles = ["Red", "Green", "Blue"]
    
    override required init(frame: CGRect)
    {
        super.init(frame: frame)
        
        redWidget = SliderWidget(frame: CGRectZero)
        greenWidget = SliderWidget(frame: CGRectZero)
        blueWidget = SliderWidget(frame: CGRectZero)
        
        widgets = [redWidget, greenWidget, blueWidget]
    }

    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview()
    {
        for (i: Int, widget: SliderWidget) in enumerate(widgets)
        {
            addSubview(widget)
            
            widget.title = widgetTitles[i]
            
            widget.addTarget(self, action: "sliderChangeHandler", forControlEvents: UIControlEvents.ValueChanged)
        }
    }
    
    func sliderChangeHandler()
    {
        enableObserversOnColorComponents = false
        
        currentColor = UIColor.colorFromFloats(redComponent: redWidget.value, greenComponent: greenWidget.value, blueComponent: blueWidget.value)
        
        enableObserversOnColorComponents = true
    }
    
    private var redComponent: Float = 0
    {
        didSet
        {
            if enableObserversOnColorComponents
            {
                redWidget.value = redComponent
            }
        }
    }
    
    private var greenComponent: Float = 0
    {
        didSet
        {
            if enableObserversOnColorComponents
            {
                greenWidget.value = greenComponent
            }
        }
    }
    
    private var blueComponent: Float = 0
    {
        didSet
        {
            if enableObserversOnColorComponents
            {
                blueWidget.value = blueComponent
            }
        }
    }
    
    var currentColor: UIColor = UIColor.blackColor()
    {
        didSet
        {
            redComponent = currentColor.getRGB().redComponent
            greenComponent = currentColor.getRGB().greenComponent
            blueComponent = currentColor.getRGB().blueComponent
            
            println("color \(currentColor)")
            
            sendActionsForControlEvents(UIControlEvents.ValueChanged)
        }
    }
    
    override func layoutSubviews()
    {
        let widgetHeight = frame.height / 3
        let margin = CGFloat(6)
        
        for (i: Int, widget: SliderWidget) in enumerate(widgets)
        {
            widget.frame = CGRect(x: 0, y: CGFloat(i) * widgetHeight, width: frame.width, height: widgetHeight).rectByInsetting(dx: margin, dy: margin)
        }
        
    }
    
}
