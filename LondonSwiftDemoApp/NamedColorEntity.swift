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
  
        var namedColor = NamedColor(name: name, color: color)
        
        namedColor.entityRef = entity
        
        return namedColor
    }
    
    class func createInManagedObjectContext(moc: NSManagedObjectContext, namedColor: NamedColor) -> NamedColorEntity
    {
        let newEntity = NSEntityDescription.insertNewObjectForEntityForName("NamedColorEntity", inManagedObjectContext: moc) as NamedColorEntity
        
        let colorComponents = namedColor.color.getRGB()
        
        newEntity.redComponent = colorComponents.redComponent
        newEntity.greenComponent = colorComponents.greenComponent
        newEntity.blueComponent = colorComponents.blueComponent

        newEntity.colorName = namedColor.name
        
        namedColor.entityRef = newEntity
        
        return newEntity
    }
}


