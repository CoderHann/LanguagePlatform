//
//  LPTabBarController.swift
//  LanguagePlatform
//
//  Created by roki on 2017/3/22.
//  Copyright © 2017年 CoderHann. All rights reserved.
//

import UIKit

class LPTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initalItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // 添加tabbarItem
    private func initalItems() {
        
        
        
        self.addTabBarItem(itemVC: LPLobbyController(), title: "大厅", normalImage: "lp_lobbyItemNormalIcon", selectedImage: "lp_lobbyItemSelectedIcon")
        self.addTabBarItem(itemVC: LPDiscoveryController(), title: "发现", normalImage: "lp_discoveryItemNormalIcon", selectedImage: "lp_discoveryItemSelectedIcon")
        self.addTabBarItem(itemVC: LPMineController(), title: "我的", normalImage: "lp_mineItemNormalIcon", selectedImage: "lp_mineItemSelectedIcon")
        
        
    }
    
    
    private func addTabBarItem(itemVC controller: LPBaseViewController, title: String, normalImage: String, selectedImage: String) {
        
        controller.tabBarItem.title = title
        controller.tabBarItem.image = UIImage.init(named: normalImage)
        controller.tabBarItem.selectedImage = UIImage.init(named: selectedImage)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        controller.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.init(red: 139/255.0, green: 139/255.0, blue: 139/255.0, alpha: 1.0)], for: UIControlState.normal)
        controller.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.init(red: 70/255.0, green: 185/255.0, blue: 66/255.0, alpha: 1.0)], for: UIControlState.selected)
        
        
        let nav = LPNavigationController.init(rootViewController: controller);
        self.addChildViewController(nav);
    }

}
