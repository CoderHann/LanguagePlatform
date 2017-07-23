//
//  LPEnhanceUtil.swift
//  LanguagePlatform
//
//  Created by roki on 2017/5/25.
//  Copyright © 2017年 CoderHann. All rights reserved.
//

import Foundation
import UIKit

// MARK:String
extension String {
    
    var length: Int {
        get {
            return self.characters.count;
        }
    }
}


// MARK:UIView
extension UIView {
    
    // MARK: frame size point
    var NUWidth: CGFloat {
        get {
            return self.frame.size.width;
        }
        
        set {
            self.frame.size.width = newValue;
        }
    }
    
    var NUHeight: CGFloat {
        get {
            
            return self.frame.size.height;
        }
        
        set {
            self.frame.size.height = newValue;
        }
    }
}
