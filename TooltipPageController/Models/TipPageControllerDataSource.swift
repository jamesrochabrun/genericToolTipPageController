//
//  TipPageControllerDataSource.swift
//  TooltipPageController
//
//  Created by James Rochabrun on 1/29/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class TipPageControllerDataSource: NSObject, UIPageViewControllerDataSource {
    
    // MARK: - Private properties
    private var tipPageController: TipPageController?
    
    // MARK: - Initializer
    init(tipPageController: TipPageController) {
        self.tipPageController = tipPageController
        super.init()
    }

    // MARK: - Datasource methods
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        /// 1 get tip and check index
        guard let tipVC = viewController as? TipViewerController,
            let index = tipPageController?.tips.index(of: tipVC.tip) else { return nil }
        
        ///2 compare indexes and return nil if they match
        if index == tipPageController?.tips.startIndex {
            return nil
        } else{
            guard let indexBefore = tipPageController?.tips.index(before: index),
                let tip = tipPageController?.tips[indexBefore] else { return nil }
            return tipPageController?.tipViewerController(with: tip)
        }
    }
    
      func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        /// 1 get photo and check index
        guard let tipVC = viewController as? TipViewerController,
            let index = tipPageController?.tips.index(of: tipVC.tip) else {
                return nil
                
        }
        
        ///2 compare indexes and return nil if they match
        if index == (tipPageController?.tips.index(before: (tipPageController?.tips.endIndex)!))! {
            return nil
        } else{
            guard let indexAfter = tipPageController?.tips.index(after: index),
                let tip = tipPageController?.tips[indexAfter] else { return nil }
            return tipPageController?.tipViewerController(with: tip)
        }
    }
}










