//
//  TipPageController.swift
//  TooltipPageController
//
//  Created by James Rochabrun on 1/29/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

// page controller
class TipPageController: UIPageViewController {
    
    // MARK: - Properties
    var tips: [Tip] = ToolTipViewModel.dataSource
    var indexOfCurrentTip: Int = 0 /// starts from the begining of the tool tips page 0
    lazy var pageControllerDataSource: TipPageControllerDataSource = {
        return TipPageControllerDataSource(tipPageController: self)
    }()
    
    // MARK: - UI
    var pageControl = UIPageControl()
    
    // MARK: - App Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = pageControllerDataSource
        configureControllers()
        configurePageControl()
    }
    
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        pageControl = UIPageControl(frame: CGRect(x: 0, y: 25,width: 200, height: 50))
        self.pageControl.numberOfPages = tips.count
        self.pageControl.currentPage = 0
        self.delegate = self
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.white
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }

    // MARK: - Configuration
    private func configureControllers() {
        if let tipViewerController = tipViewerController(with: tips[indexOfCurrentTip]) {
            setViewControllers([tipViewerController], direction: .forward, animated: false)
        }
    }
    
    // MARK: - Helpers for Skip and button actions
    func tipViewerController(with tip: Tip) -> TipViewerController? {
        guard let storyboard = storyboard, let tipViewerController =
            storyboard.instantiateViewController(withIdentifier: "TipViewerController") as?
            TipViewerController else { return nil }
        tipViewerController.tip = tip
        return tipViewerController
    }
    
    public func forward(toIndex: Int)  {
        if let nextVC = self.pageViewController(atIndex: toIndex + 1) {
            setViewControllers([nextVC], direction: .forward, animated: false)
        }
    }
    
    func pageViewController(atIndex: Int) -> TipViewerController? {
        
        if atIndex == NSNotFound || atIndex < 0 || atIndex >= self.tips.count {
            return nil
        }
        if let pageContentVC = storyboard?.instantiateViewController(withIdentifier: "TipViewerController") as? TipViewerController {
            pageContentVC.tip = self.tips[atIndex]
            return pageContentVC
        }
        return nil
    }
}

extension TipPageController: UIPageViewControllerDelegate {
    
    // MARK: Delegate functions
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        let tip = tips[0]
        self.pageControl.currentPage = tips.index(of: tip)!
    }
    
}






