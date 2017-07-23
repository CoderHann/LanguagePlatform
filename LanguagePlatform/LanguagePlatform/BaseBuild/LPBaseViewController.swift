//
//  LPBaseViewController.swift
//  LanguagePlatform
//
//  Created by roki on 2017/3/22.
//  Copyright © 2017年 CoderHann. All rights reserved.
//

import UIKit

class LPBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.colorWith(red: 248, green: 248, blue: 248);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event);
        self.view.endEditing(true);
    }
}
