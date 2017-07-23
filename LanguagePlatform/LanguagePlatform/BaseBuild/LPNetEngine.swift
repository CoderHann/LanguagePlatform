//
//  LPNetEngine.swift
//  LanguagePlatform
//
//  Created by roki on 2017/5/8.
//  Copyright © 2017年 CoderHann. All rights reserved.
//

import Foundation
import Alamofire


class LPNetEngine: NSObject {
    
    
    
    
    
    /// 注册接口
    ///
    /// - Parameters:
    ///   - email: 邮箱账户号
    ///   - nickName: 昵名
    ///   - password: 密码
    /// - Returns: dataRequest对象
    class func requestRegister(email: String, nickName:String, password: String) -> DataRequest {
        
        var params = Dictionary<String, String>();
        params["email"] = email;
        params["nickName"] = nickName;
        params["password"] = password;
        params["iconURL"] = "1";
        
        return LPRequestManager.shareManager.postRequest(params: params, method: "account/register.action");
        
        
    }
    
    class func requestLogin(email: String, password: String) -> DataRequest {
        
        var params = Dictionary<String, String>();
        params["email"] = email;
        params["password"] = password;
        
        return LPRequestManager.shareManager.postRequest(params: params, method: "account/login.action");
        
        
    }

}



