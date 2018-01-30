//
//  Tip.swift
//  TooltipPageController
//
//  Created by James Rochabrun on 1/29/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class Tip: NSObject {
    
    let titleTip: String?
    let bodyTip: String?
    let actionText: String?
    let color: UIColor?
    let index: Int
    
    init(titleTip: String, bodyTip: String, actionText: String, color: UIColor, index: Int) {
        self.titleTip = titleTip
        self.bodyTip = bodyTip
        self.actionText = actionText
        self.color = color
        self.index = index
    }
}

struct ToolTipViewModel {
    
    static var dataSource: [Tip] {
        return [ Tip(titleTip: "tip one", bodyTip: "", actionText: "", color: #colorLiteral(red: 1, green: 0.4060918689, blue: 0.1189902052, alpha: 1), index: 0),
                 Tip(titleTip: "tip two", bodyTip: "", actionText: "", color: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1), index: 1),
                 Tip(titleTip: "tip three", bodyTip: "", actionText: "", color: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), index: 2)
        ]
    }
}

