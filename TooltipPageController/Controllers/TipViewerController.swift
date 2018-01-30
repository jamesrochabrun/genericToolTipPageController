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
    @IBOutlet weak var transitionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tipLabel.text = tip.titleTip
        self.view.backgroundColor = tip.color
        setUpUI()
    }
    
    private func setUpUI() {
        switch self.tip.index {
        case 0...1:
            self.transitionButton.setTitle("Skip", for: .normal)
        case 2:
            self.transitionButton.setTitle("", for: .normal)
        default:
            break
        }
    }
    
    // MARK: - action of
    @IBAction func transition(_ sender: UIButton) {
        
        switch self.tip.index {
        case 0...1:
            let pageVC = parent as! TipPageController
            pageVC.forward(toIndex: self.tip.index)
        case 2:
            
            // skip or dismiss controller
            let defaults = UserDefaults.standard
            defaults.set(true, forKey: "hasViewedTutorial")
            self.dismiss(animated: true, completion: nil)
        default:
            break
        }
    }
}

