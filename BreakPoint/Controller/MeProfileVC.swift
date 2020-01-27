//
//  MeProfileVC.swift
//  BreakPoint
//
//  Created by walid elzo on 1/27/20.
//  Copyright © 2020 NanoSoft. All rights reserved.
//

import UIKit

class MeProfileVC: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileEmailLbl: UILabel!
    
    @IBOutlet weak var profileTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func profileLogOut(_ sender: Any) {
    }
}
