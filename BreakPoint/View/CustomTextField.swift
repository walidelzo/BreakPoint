//
//  CustomTextField.swift
//  BreakPoint
//
//  Created by walid elzo on 1/19/20.
//  Copyright © 2020 NanoSoft. All rights reserved.
//

import UIKit
class CustomTextField: UITextField {
    
    override func awakeFromNib() {
        changePlacholderAttr()
        super.awakeFromNib()
    }
    
    private var padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
   
    func changePlacholderAttr() {
        if let placeHolder = self.placeholder {
        let attributedPlaceholderr = NSAttributedString(string:placeHolder, attributes: [NSAttributedString.Key.foregroundColor :UIColor.white])
        self.attributedPlaceholder = attributedPlaceholderr
        }
        
    }
}
