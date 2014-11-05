//
//  ColorSpinnerItemRenderer.swift
//  NumericDial
//
//  Created by Simon Gladman on 09/09/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import UIKit

class ColorSpinnerItemRenderer: UIControl
{
    let label = UILabel(frame: CGRectZero)
    
    let border = UIView(frame: CGRectZero)
    let swatch = UIView(frame: CGRectZero)
    
    init(frame : CGRect, color : NamedColor)
    {
        super.init(frame: frame)
        
        label.text = color.name
        border.backgroundColor = UIColor.whiteColor()
        swatch.backgroundColor = color.color
        
        addSubview(label)
        
        if (color.color != UIColor.clearColor())
        {
            addSubview(border)
            addSubview(swatch)
        }
    }
    
    required init(coder: NSCoder)
    {
        super.init(coder: coder)
    }
    
    override func layoutSubviews()
    {
        label.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        
        border.frame = CGRect(x: frame.width - frame.height - 25, y: 0, width: frame.height, height: frame.height).rectByInsetting(dx: 4, dy: 4)
        swatch.frame = CGRect(x: frame.width - frame.height - 25, y: 0, width: frame.height, height: frame.height).rectByInsetting(dx: 6, dy: 6)
    }
    
    
}
