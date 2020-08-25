//
//  RoundView.swift
//  BreakPoint
//
//  Created by walid elzo on 1/21/20.
//  Copyright © 2020 NanoSoft. All rights reserved.
//

import UIKit

class RoundLabelView: UILabel {

    override func awakeFromNib() {
        makeTheLabelRounded()
        super.awakeFromNib()
    }
    func makeTheLabelRounded() {
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }

}
