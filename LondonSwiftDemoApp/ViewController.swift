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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.addSubview(colorSwatch)
        view.addSubview(colorPicker)
        view.addSubview(rgbWidget)
        view.addSubview(savedColorsGrid)
        view.addSubview(toolbar)
    }

    override func viewDidLayoutSubviews()
    {
        let toolbarHeight: CGFloat = 50
        let contentHeight = view.frame.height - toolbarHeight
        
        if view.frame.width > view.frame.height
        {
            // landscape
            
            let leftColumnWidth = view.frame.width * 0.34
            let rightColumnWidth = view.frame.width * 0.66
            
            let upperRowHeight = contentHeight * 0.66
            let bottomRowHeight = contentHeight * 0.34 - topLayoutGuide.length
            
            let upperRowTop = topLayoutGuide.length
            let bottomRowTop = upperRowHeight + upperRowTop
            
            colorSwatch.frame = CGRect(x: 0, y: upperRowTop, width: leftColumnWidth, height: upperRowHeight)
            savedColorsGrid.frame = CGRect(x: leftColumnWidth, y: upperRowTop, width: rightColumnWidth, height: upperRowHeight)
            
            colorPicker.frame = CGRect(x: 0, y: bottomRowTop, width: leftColumnWidth, height: bottomRowHeight)
            rgbWidget.frame = CGRect(x: leftColumnWidth, y: bottomRowTop, width: rightColumnWidth, height: bottomRowHeight)
        }
        else
        {
            // portrait
            
            let rowHeight = contentHeight / 4
            let contentWidth = view.frame.width
            
            colorSwatch.frame = CGRect(x: 0, y: 0, width: contentWidth, height: rowHeight)
            savedColorsGrid.frame = CGRect(x: 0, y: rowHeight, width: contentWidth, height: rowHeight)
            
            colorPicker.frame = CGRect(x: 0, y: rowHeight * 2, width: contentWidth, height: rowHeight)
            rgbWidget.frame = CGRect(x: 0, y: rowHeight * 3, width: contentWidth, height: rowHeight)
        }
        
        toolbar.frame = CGRect(x: 0, y: view.frame.height - toolbarHeight, width: view.frame.width, height: toolbarHeight)
    }

}

