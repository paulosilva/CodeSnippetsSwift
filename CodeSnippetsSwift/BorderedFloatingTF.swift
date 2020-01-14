//
//  BorderedFloatingTF.swift
//  News
//
//  Created by Paulo Silva on 19/01/2018.
//  Copyright © 2018 Pace Fitness. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

@IBDesignable
class BorderedFloatingTF: UITextField {
    
    required init?(coder aDecoder:NSCoder) {
        super.init(coder:aDecoder)
        setup()
    }
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        setup()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 20, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
    
    
    // properties..
    @IBInspectable var enableTitle : Bool = false
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: Int = 1 {
        didSet {
            layer.borderWidth = CGFloat(borderWidth)
        }
    }
    
    @IBInspectable var placeHolderColor: UIColor = UIColor.white {
        didSet {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: placeHolderColor])
        }
    }
    
    func setup() {
        borderStyle = UITextField.BorderStyle.none
        layer.borderWidth = CGFloat(borderWidth)
        layer.borderColor = borderColor.cgColor
        placeHolderColor = UIColor.white
    }
}


