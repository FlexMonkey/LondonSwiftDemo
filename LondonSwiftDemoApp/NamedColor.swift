//
//  NamedColor.swift
//  LondonSwiftDemoApp
//
//  Created by Simon Gladman on 07/11/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import Foundation
import UIKit

class NamedColor: Equatable
{
    var color : UIColor
    let uuid: String
    
    var entityRef: NamedColorEntity?
    
    init(name : String, color : UIColor)
    {
        uuid = NSUUID().UUIDString
        
        self.name = name;
        self.color = color
    }
    
    var name : String
    {
        didSet
        {
            if let _entityRef = entityRef
            {
                _entityRef.colorName = name
                
                let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
                
                appDelegate.saveContext()
            }
        }
    }
}

func == (lhs: NamedColor, rhs: NamedColor) -> Bool
{
    return lhs.uuid == rhs.uuid
}