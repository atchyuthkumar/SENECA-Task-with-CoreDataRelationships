//
//  TabbarViewController.swift
//  Seneca_Atchyuth
//
//  Created by Smscountry on 20/03/21.
//

import UIKit

class TabbarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adding separator here
        if let items = self.tabBar.items {
            self.tabBar.backgroundColor = UIColor(red: 219.0/255.0, green: 219.0/255.0, blue: 225.0/255.0, alpha: 1)
            let height = self.tabBar.bounds.height
            
            let numItems = CGFloat(items.count)
            let itemSize = CGSize(
                width: tabBar.frame.width / numItems,
                height: tabBar.frame.height)
            
            for (index, _) in items.enumerated() {
                
                
                if index > 0 {
                    let xPosition = itemSize.width * CGFloat(index)
                    let separator = UIView(frame: CGRect(
                                            x: xPosition, y: 0, width: 0.5, height: height))
                    separator.backgroundColor = UIColor.gray
                    tabBar.insertSubview(separator, at: 1)
                }
            }
        }
    }
    
    
    
    
}
