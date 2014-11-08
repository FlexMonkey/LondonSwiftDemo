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
    var name : String
    var color : UIColor
    let uuid: String
    
    init(name : String, color : UIColor)
    {
        uuid = NSUUID().UUIDString
        
        self.name = name;
        self.color = color
    }
}

func == (lhs: NamedColor, rhs: NamedColor) -> Bool
{
    return lhs.uuid == rhs.uuid
}