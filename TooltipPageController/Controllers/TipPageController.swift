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
    
    // MARK: - App Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = pageControllerDataSource
        configureControllers()
    }
    
    // MARK: - Configuration
    private func configureControllers() {
        if let tipViewerController = tipViewerController(with: tips[indexOfCurrentTip]) {
            setViewControllers([tipViewerController], direction: .forward, animated: false)
        }
    }
    
    func tipViewerController(with tip: Tip) -> TipViewerController? {
        guard let storyboard = storyboard, let tipViewerController =
            storyboard.instantiateViewController(withIdentifier: "TipViewerController") as?
            TipViewerController else { return nil }
        tipViewerController.tip = tip
        return tipViewerController
    }
    
    // MARK: - Helpers for Skip and button actions
    public func forward(toIndex: Int)  {
        if let nextVC = self.pageControllerDataSource.pageViewController(atIndex: toIndex + 1) {
            setViewControllers([nextVC], direction: .forward, animated: false)
        }
    }
}

extension TipPageController: UIPageViewControllerDelegate {
    
    // MARK: Delegate functions
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {

    }
    
}






