//
//  UIColor+Extension.swift
//  LanguagePlatform
//
//  Created by roki on 2017/5/2.
//  Copyright © 2017年 CoderHann. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func colorWith(red: Int, green: Int, blue: Int) -> UIColor{
        let rgbColor = UIColor.init(colorLiteralRed: Float(red)/255.0, green: Float(green)/255.0, blue: Float(blue)/255.0, alpha: 1.0);
        return rgbColor;
        
    }
    class func colorWithAlpha(red: Int, green: Int, blue: Int, alpha: Float) -> UIColor{
        let rgbColor = UIColor.init(colorLiteralRed: Float(red)/255.0, green: Float(green)/255.0, blue: Float(blue)/255.0, alpha: alpha);
        return rgbColor;
        
    }
    
    
    
    class var LPMainColor: UIColor {
        
        get {
            return colorWith(red: 38, green: 132, blue: 221);
        }
    }
    
}
