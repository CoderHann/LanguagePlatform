//
//  LPRequestManager.swift
//  LanguagePlatform
//
//  Created by roki on 2017/5/19.
//  Copyright © 2017年 CoderHann. All rights reserved.
//

import UIKit
import Alamofire

class LPRequestManager: SessionManager {
    
    static let shareManager = LPRequestManager();
    let baseURL = "http://192.168.157.252:8080/home/";
    
    
    private init() {
        
        super.init(configuration: URLSessionConfiguration.default, delegate: SessionDelegate(), serverTrustPolicyManager: nil);
        
        
    }
    
    
    func postRequest(params: Dictionary<String, String>,method: String) ->DataRequest{
        
        
        return self.request(self.baseURL + method, method: HTTPMethod.post, parameters: params, encoding: URLEncoding.default, headers: nil);
    }
    
    
    
    
}

extension DataRequest {

    
    @discardableResult
    public func jsonResponse(
        completionHandler: @escaping (_ reponse: LPResponse,_ isSuccess: Bool) -> Void)
        -> Self
    {
        
        let response = LPResponse();
        
        responseJSON { (jsonResponse) in
            
            response.isSuccess = true;
            response.result = nil;
            response.originResponse = jsonResponse;
            
            completionHandler(response,response.isSuccess);
            
        }
        
        return self;
    }
    

}
