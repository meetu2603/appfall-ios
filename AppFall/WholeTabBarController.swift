//
//  WholeTabBarController.swift
//  AppFall
//
//  Created by Adrian Baumgart on 10.11.18.
//  Copyright © 2018 Adrian Baumgart. All rights reserved.
//

import UIKit

class WholeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBarItems = tabBar.items! as [UITabBarItem]
        tabBarItems[0].imageInsets = UIEdgeInsets(top: 6,left: 0,bottom: -6,right: 0)
        tabBarItems[1].imageInsets = UIEdgeInsets(top: 6,left: 0,bottom: -6,right: 0)
        // Do any additional setup after loading the view.
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
