//
//  Extensions.swift
//  LondonSwiftDemoApp
//
//  Created by Simon Gladman on 04/11/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import Foundation


extension Float
{
    func format() -> NSString
    {
        return NSString(format: "%.4f", self)
    }
}