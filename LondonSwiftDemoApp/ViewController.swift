//
//  ViewController.swift
//  LondonSwiftDemoApp
//
//  Created by Simon Gladman on 03/11/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    let colorSwatch = ColorSwatch(frame: CGRectZero)
    let toolbar = UIToolbar(frame: CGRectZero)
    let colorPicker = ColorPicker(frame: CGRectZero)
    let rgbWidget = RGBWidget(frame: CGRectZero)
    let savedColorsGrid = SavedColorsGrid(frame: CGRectZero)
    
    let alertController: UIAlertController!
    let makeDarkerAlertAction: UIAlertAction!
    let makeDarkerLighterAction: UIAlertAction!
    
    let appDelegate: AppDelegate
    let managedObjectContext: NSManagedObjectContext
    
    required init(coder aDecoder: NSCoder)
    {
        appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        managedObjectContext = appDelegate.managedObjectContext!
        
        super.init(coder: aDecoder)
        
        alertController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        makeDarkerAlertAction = UIAlertAction(title: "Make darker", style: UIAlertActionStyle.Default, handler: adjustColor)
        makeDarkerLighterAction = UIAlertAction(title: "Make lighter", style: UIAlertActionStyle.Default, handler: adjustColor)
        
        alertController.addAction(makeDarkerLighterAction)
        alertController.addAction(makeDarkerAlertAction)
    }
    
    var savedColors: [NamedColor] = [NamedColor]()
    {
        didSet
        {
            savedColorsGrid.colors = savedColors
        }
    }
    
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
        savedColorsGrid.addTarget(self, action: "savedColorsGridSelectHandler", forControlEvents: UIControlEvents.ValueChanged)
 
        populateToolbar()
        
        loadSavedColors()
    }

    func colorPickerChangeHandler()
    {
        currentColor = colorPicker.currentColor
    }
    
    func rgbWidgetChangeHandler()
    {
        currentColor = rgbWidget.currentColor
    }
    
    func savedColorsGridSelectHandler()
    {
        currentColor = savedColorsGrid.getSelectedColor()
    }
    
    func populateToolbar()
    {
        let saveBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItemStyle.Plain, target: self, action: "saveCurrentColor")
        let tweakBarButtonItem = UIBarButtonItem(title: "Tweak", style: UIBarButtonItemStyle.Plain, target: self, action: "showTweakMenu:")
        let aboutBarButtonItem = UIBarButtonItem(title: "About", style: UIBarButtonItemStyle.Plain, target: self, action: "showAbout")
        
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([saveBarButtonItem, spacer, tweakBarButtonItem, spacer, aboutBarButtonItem], animated: true)
    }
    
    func loadSavedColors()
    {
        let fetchRequest = NSFetchRequest(entityName: "NamedColorEntity")
        
        if let fetchResults = managedObjectContext.executeFetchRequest(fetchRequest, error: nil) as? [NamedColorEntity]
        {
            var loadedColors = [NamedColor]()
            
            for namedColorEntity in fetchResults
            {
                loadedColors.append(NamedColorEntity.createInstanceFromEntity(namedColorEntity))
            }
            
            savedColors = loadedColors
        }
    }
    
    func saveCurrentColor()
    {
        let savedColor = NamedColor(name: currentColor.getHex(), color: currentColor)
        
        savedColors.insert(savedColor, atIndex: 0)
        
        NamedColorEntity.createInManagedObjectContext(managedObjectContext, namedColor: savedColor)
  
        appDelegate.saveContext()
    }
    
    func showTweakMenu(value: UIBarButtonItem)
    {
        alertController.popoverPresentationController?.barButtonItem = value
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func adjustColor(value: UIAlertAction!)
    {
        if value == makeDarkerAlertAction
        {
            currentColor = currentColor.makeDarker()
        }
        else if value == makeDarkerLighterAction
        {
            currentColor = currentColor.makeLighter()
        }
    }
    
    func showAbout()
    {
        var alertController = UIAlertController(title: "London Swift Demo Application", message: "Simon Gladman | November 2014", preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        let openBlogAction = UIAlertAction(title: "Open Blog", style: .Default, handler: visitFlexMonkey)
        
        alertController.addAction(okAction)
        alertController.addAction(openBlogAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func visitFlexMonkey(value: UIAlertAction!)
    {
       UIApplication.sharedApplication().openURL(NSURL(string: "http://flexmonkey.blogspot.co.uk")!)
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

