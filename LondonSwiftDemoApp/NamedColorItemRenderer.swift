//
//  NamedColorItemRenderer.swift
//
//  Created by Simon Gladman on 09/09/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import UIKit

class NamedColorItemRenderer: UICollectionViewCell
{
    let label = UILabel(frame: CGRectZero)
    
    let border = UIView(frame: CGRectZero)
    let swatch = UIView(frame: CGRectZero)
    
    override init(frame : CGRect)
    {
        super.init(frame: frame)
        
        border.backgroundColor = UIColor.whiteColor()
        
        addSubview(label)
        
        addSubview(border)
        addSubview(swatch)
    }

    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    var hasBackground: Bool = false
    {
        didSet
        {
            if hasBackground
            {
                layer.cornerRadius = 5
                layer.backgroundColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.25).CGColor
            }
            else
            {
                layer.backgroundColor = UIColor.clearColor().CGColor
            }
        }
    }
    
    var namedColor: NamedColor?
    {
        didSet
        {
            if let _namedColor = namedColor
            {
                label.text = _namedColor.name
                swatch.backgroundColor = _namedColor.color
            }
        }
    }
    
    override func layoutSubviews()
    {
        label.frame = CGRect(x: 10, y: 0, width: frame.width, height: frame.height)
        
        border.layer.cornerRadius = 3
        swatch.layer.cornerRadius = 3
        
        border.frame = CGRect(x: frame.width - frame.height - 25, y: 0, width: frame.height, height: frame.height).rectByInsetting(dx: 4, dy: 4)
        swatch.frame = CGRect(x: frame.width - frame.height - 25, y: 0, width: frame.height, height: frame.height).rectByInsetting(dx: 6, dy: 6)
    }
    
    
}
