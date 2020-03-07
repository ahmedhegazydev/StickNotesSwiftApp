//
//  TabViewController ViewController.swift
//  StickyNotsIosApp
//
//  Created by Ahmed Hegazy on 3/7/20.
//  Copyright © 2020 Ahmed Hegazy. All rights reserved.
//

import UIKit
import Tabman
import Pageboy


//class TabViewController: UIViewController {
class TabViewController: TabmanViewController{
    
    //Set up your view controller with the an array of view controllers that you want to appear.
    private var viewControllers = [ViewController(), ViewController()]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //Set the PageboyViewControllerDataSource data source of the TabmanViewController.
        self.dataSource = self;
        
        
        
        // Create bar
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap // Customize
        
        // Add to view
        addBar(bar, dataSource: self, at: .top)
        
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}

extension TabViewController: TMBarDataSource, PageboyViewControllerDataSource{
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        
        let title = "Page \(index)"
        return TMBarItem(title: title)
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil;
    }
    
    
    
}
