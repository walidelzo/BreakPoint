//
//  UIView+ext.swift
//  BreakPoint
//
//  Created by walid elzo on 3/7/20.
//  Copyright © 2020 NanoSoft. All rights reserved.
//

import UIKit

extension UIView {
    func makeButtonUpToKeboard() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillChange(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
  @objc func keyBoardWillChange(_ notification :NSNotification) {
    
    let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
    let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
    let begingFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
    let endingFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue ).cgRectValue
    let deltaY = endingFrame.origin.y - begingFrame.origin.y
    UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: curve), animations: {
        self.frame.origin.y += deltaY
    }, completion: nil)
    
    
    
}


}
