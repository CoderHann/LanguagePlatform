//
//  LPResponse.swift
//  LanguagePlatform
//
//  Created by roki on 2017/5/24.
//  Copyright © 2017年 CoderHann. All rights reserved.
//

import UIKit
import Alamofire

public class LPResponse: NSObject {
    
    var isSuccess = false;
    var result: Dictionary<String, Any>?;
    var originResponse: DataResponse<Any>?;
    
    override init() {
        super.init();
        
    }
    

}
