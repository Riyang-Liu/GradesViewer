//
//  GlobalSplitViewController.swift
//  GradesViewer
//
//  Created by Riyang Liu on 12/22/15.
//  Copyright © 2015 Riyang-Liu. All rights reserved.
//

import UIKit

//Forcing the split view to process the master view first.
class GlobalSplitViewController: UISplitViewController, UISplitViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
    }
    
    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool{
        return true
    }
    
}
