//
//  ViewController.swift
//  LondonSwiftDemoApp
//
//  Created by Simon Gladman on 03/11/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let colorSwatch = ColorSwatch(frame: CGRectZero)
    let toolbar = UIToolbar(frame: CGRectZero)
    let colorPicker = ColorPicker(frame: CGRectZero)
    let rgbWidget = RGBWidget(frame: CGRectZero)
    let savedColorsGrid = SavedColorsGrid(frame: CGRectZero)
    
    var uiControlEventsEnabled = true;
    
    var currentColor: UIColor = UIColor.brownColor()
    {
        didSet
        {
            if !(rgbWidget.currentColor == currentColor)
            {
                rgbWidget.currentColor = currentColor
            }
            
            if !(colorPicker.currentColor == currentColor)
            {
                colorPicker.currentColor = currentColor
            }
            
            colorSwatch.currentColor = currentColor
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.addSubview(colorSwatch)
        view.addSubview(colorPicker)
        view.addSubview(rgbWidget)
        view.addSubview(savedColorsGrid)
        view.addSubview(toolbar)
        
        view.backgroundColor = UIColor.lightGrayColor()
        
        currentColor = UIColor.brownColor()
        
        rgbWidget.addTarget(self, action: "rgbWidgetChangeHandler", forControlEvents: UIControlEvents.ValueChanged)
        colorPicker.addTarget(self, action: "colorPickerChangeHandler", forControlEvents: UIControlEvents.ValueChanged)
    }

    func colorPickerChangeHandler()
    {
        currentColor = colorPicker.currentColor
    }
    
    func rgbWidgetChangeHandler()
    {
        currentColor = rgbWidget.currentColor
    }
    
    override func viewDidLayoutSubviews()
    {
        let toolbarHeight: CGFloat = 50
        let contentHeight = view.frame.height - toolbarHeight
        let margin = CGFloat(10)
        
        if view.frame.width > view.frame.height
        {
            // landscape
            
            let leftColumnWidth = view.frame.width * 0.34
            let rightColumnWidth = view.frame.width * 0.66
            
            let upperRowHeight = contentHeight * 0.66
            let bottomRowHeight = contentHeight * 0.34 - topLayoutGuide.length
            
            let upperRowTop = topLayoutGuide.length
            let bottomRowTop = upperRowHeight + upperRowTop
            
            savedColorsGrid.frame = CGRect(x: 0, y: upperRowTop, width: leftColumnWidth, height: upperRowHeight).rectByInsetting(dx: margin, dy: margin)
            colorSwatch.frame = CGRect(x: leftColumnWidth, y: upperRowTop, width: rightColumnWidth, height: upperRowHeight).rectByInsetting(dx: margin, dy: margin)
            
            colorPicker.frame = CGRect(x: 0, y: bottomRowTop, width: leftColumnWidth, height: bottomRowHeight).rectByInsetting(dx: margin, dy: margin)
            rgbWidget.frame = CGRect(x: leftColumnWidth, y: bottomRowTop, width: rightColumnWidth, height: bottomRowHeight).rectByInsetting(dx: margin, dy: margin)
        }
        else
        {
            // portrait
            
            let rowHeight = (contentHeight - topLayoutGuide.length) / 4
            let contentWidth = view.frame.width
            
            colorSwatch.frame = CGRect(x: 0, y: topLayoutGuide.length, width: contentWidth, height: rowHeight).rectByInsetting(dx: margin, dy: margin)
            savedColorsGrid.frame = CGRect(x: 0, y: rowHeight + topLayoutGuide.length, width: contentWidth, height: rowHeight).rectByInsetting(dx: margin, dy: margin)
            
            colorPicker.frame = CGRect(x: 0, y: rowHeight * 2 + topLayoutGuide.length, width: contentWidth, height: rowHeight).rectByInsetting(dx: margin, dy: margin)
            rgbWidget.frame = CGRect(x: 0, y: rowHeight * 3 + topLayoutGuide.length, width: contentWidth, height: rowHeight).rectByInsetting(dx: margin, dy: margin)
        }
        
        toolbar.frame = CGRect(x: 0, y: view.frame.height - toolbarHeight, width: view.frame.width, height: toolbarHeight)
    }

}

