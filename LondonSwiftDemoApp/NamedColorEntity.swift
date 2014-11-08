//
//  NamedColorEntity.swift
//  LondonSwiftDemoApp
//
//  Created by Simon Gladman on 08/11/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class NamedColorEntity: NSManagedObject
{
    @NSManaged var redComponent: NSNumber
    @NSManaged var greenComponent: NSNumber
    @NSManaged var blueComponent: NSNumber
    @NSManaged var colorName: String
    
    class func createInstanceFromEntity(entity: NamedColorEntity) -> NamedColor!
    { 
        let name = entity.colorName
        let color = UIColor.colorFromNSNumbers(redComponent: entity.redComponent, greenComponent: entity.greenComponent, blueComponent: entity.blueComponent)
  
        return NamedColor(name: name, color: color)
    }
    
    class func createInManagedObjectContext(moc: NSManagedObjectContext, namedColor: NamedColor) -> NamedColorEntity
    {
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("NamedColorEntity", inManagedObjectContext: moc) as NamedColorEntity
        
        let colorComponents = namedColor.color.getRGB()
        
        newItem.redComponent = colorComponents.redComponent
        newItem.greenComponent = colorComponents.greenComponent
        newItem.blueComponent = colorComponents.blueComponent

        newItem.colorName = namedColor.name
        
        return newItem
    }
}


