//
//  RoundedButton.swift
//  BreakPoint
//
//  Created by walid elzo on 1/21/20.
//  Copyright © 2020 NanoSoft. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    override func awakeFromNib() {
           makeTheViewRounded()
           super.awakeFromNib()
       }
       func makeTheViewRounded() {
           self.layer.cornerRadius = 10
           self.layer.borderColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
       }

}
