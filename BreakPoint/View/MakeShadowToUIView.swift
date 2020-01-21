//
//  MakeShadowToUIView.swift
//  BreakPoint
//
//  Created by walid elzo on 1/19/20.
//  Copyright © 2020 NanoSoft. All rights reserved.
//

import UIKit

class MakeShadowToUIView: UIView {
    
    override func awakeFromNib() {
        makeAshadowOnView()
        super.awakeFromNib()
    }
    func makeAshadowOnView() {
        
        self.layer.shadowOpacity = 0.9
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.lightGray.cgColor
    }

}
