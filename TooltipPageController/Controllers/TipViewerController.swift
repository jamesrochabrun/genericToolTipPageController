//
//  TipViewerController.swift
//  TooltipPageController
//
//  Created by James Rochabrun on 1/29/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.

import Foundation
import UIKit

class TipViewerController:  UIViewController {
    
    var tip: Tip!
    @IBOutlet weak var tipLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tipLabel.text = tip.titleTip
        self.view.backgroundColor = tip.color
    }
}

