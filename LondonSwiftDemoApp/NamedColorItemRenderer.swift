//
//  NamedColorItemRenderer.swift
//
//  Created by Simon Gladman on 09/09/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import UIKit

class NamedColorItemRenderer: UICollectionViewCell, UITextFieldDelegate
{
    let label = UILabel(frame: CGRectZero)
    
    let textInput = UITextField(frame: CGRectZero)
    
    let border = UIView(frame: CGRectZero)
    let swatch = UIView(frame: CGRectZero)
    
    override init(frame : CGRect)
    {
        super.init(frame: frame)
        
        border.backgroundColor = UIColor.whiteColor()
        
        textInput.borderStyle = UITextBorderStyle.RoundedRect
        textInput.clearButtonMode = UITextFieldViewMode.Always
        textInput.keyboardAppearance = UIKeyboardAppearance.Dark
        textInput.delegate = self
        
        addSubview(label)
        addSubview(border)
        addSubview(swatch)
    }

    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    var editable: Bool = false
    {
        didSet
        {
            if editable
            {
                label.removeFromSuperview()
                addSubview(textInput)
            }
            else
            {
                textInput.removeFromSuperview()
                addSubview(label)
            }
        }
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
                textInput.text = _namedColor.name
                swatch.backgroundColor = _namedColor.color
            }
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField)
    {
        if namedColor != nil
        {
            namedColor!.name = textInput.text
        }
    }
    
    override func layoutSubviews()
    {
        label.frame = CGRect(x: 10, y: 0, width: frame.width, height: frame.height)
        
        textInput.frame = CGRect(x: 4, y: 0, width: frame.width * 0.5, height: frame.height).rectByInsetting(dx: 4, dy: 4)
        
        border.layer.cornerRadius = 3
        swatch.layer.cornerRadius = 3
        
        border.frame = CGRect(x: frame.width - frame.height - 25, y: 0, width: frame.height, height: frame.height).rectByInsetting(dx: 4, dy: 4)
        swatch.frame = CGRect(x: frame.width - frame.height - 25, y: 0, width: frame.height, height: frame.height).rectByInsetting(dx: 6, dy: 6)
    }
    
    
}
