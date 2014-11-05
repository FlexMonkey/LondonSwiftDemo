//
//  Extensions.swift
//  LondonSwiftDemoApp
//
//  Created by Simon Gladman on 04/11/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import Foundation
import UIKit


extension Float
{
    func format() -> NSString
    {
        return NSString(format: "%.4f", self)
    }
}

extension UIColor
{
    class func colorFromFloats(#redComponent: Float, greenComponent: Float, blueComponent: Float) -> UIColor
    {
        return UIColor(red: CGFloat(redComponent), green: CGFloat(greenComponent), blue: CGFloat(blueComponent), alpha: 1.0)
    }
    
    func getRGB() -> (redComponent: Float, greenComponent: Float, blueComponent: Float)
    {
        let colorRef = CGColorGetComponents(self.CGColor);
        
        let redComponent = Float(colorRef[0])
        let greenComponent = Float(colorRef[1])
        let blueComponent = Float(colorRef[2])
        
        return (redComponent: redComponent, greenComponent: greenComponent, blueComponent: blueComponent)
    }
    
}