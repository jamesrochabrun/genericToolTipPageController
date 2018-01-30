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
        var index = (viewController as! TipViewerController).tip.index
        index -= 1
        return self.pageViewController(atIndex: index)
    }
    
      func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! TipViewerController).tip.index
        index += 1
        return self.pageViewController(atIndex: index)
    }
    
    // MARK: - Helper
    func pageViewController(atIndex: Int) -> TipViewerController? {
        
        if atIndex == NSNotFound || atIndex < 0 || atIndex >= (tipPageController?.tips.count)! {
            return nil
        }
        if let pageContentVC = tipPageController?.storyboard?.instantiateViewController(withIdentifier: "TipViewerController") as? TipViewerController {
            pageContentVC.tip = tipPageController?.tips[atIndex]
            return pageContentVC
        }
        return nil
    }
}










