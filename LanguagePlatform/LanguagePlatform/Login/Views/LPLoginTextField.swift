//
//  LPLoginTextField.swift
//  LanguagePlatform
//
//  Created by roki on 2017/5/2.
//  Copyright © 2017年 CoderHann. All rights reserved.
//

import UIKit

protocol LoginTextFieldDelegate {
    
    func loginTextFieldShouldBeginEditing(_ textField: LPLoginTextField) -> Bool;
    func loginTextFieldDidEndEditing(_ textField: LPLoginTextField);
}

class LPLoginTextField: UIView,UITextFieldDelegate {
    
    var leftNormalIcon: String
    var leftHighlightIcon: String
    
    
    var leftIconView: UIView?
    var leftImageView: UIImageView?
    
    var centerTextField: UITextField?
    var rightActionView: UIButton?
    
    var delegate: LoginTextFieldDelegate?
    
    init(normalImage: String, highlightImage: String) {
        
        leftNormalIcon = normalImage;
        leftHighlightIcon = highlightImage;
        
        super.init(frame: CGRect.zero);
        
        setup();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup() {
        
        self.backgroundColor = UIColor.colorWithAlpha(red: 70, green: 70, blue: 70, alpha: 0.25);
        self.layer.cornerRadius = 2;
        self.layer.masksToBounds = true;
        
        leftIconView = UIView.init();
        leftIconView?.backgroundColor = UIColor.colorWithAlpha(red: 30, green: 30, blue: 30, alpha: 0.5);
        self.addSubview(leftIconView!);
        
        leftImageView = UIImageView.init(image: UIImage.init(named: leftNormalIcon), highlightedImage: UIImage.init(named: leftHighlightIcon));
        leftIconView?.addSubview(leftImageView!);
        
        centerTextField = UITextField();
        centerTextField?.font = UIFont.systemFont(ofSize: 15);
        centerTextField?.textColor = UIColor.white;
        centerTextField?.delegate = self;
        self.addSubview(centerTextField!);
        
        
        
        leftIconView?.snp.makeConstraints({ (make) in
            make.left.top.equalTo(0);
            make.width.equalTo(self.snp.height);
            make.height.equalTo(self);
        })
        
        leftImageView?.snp.makeConstraints({ (make) in
            make.width.height.equalTo(self.snp.height).multipliedBy(0.5);
            make.center.equalTo(leftIconView!);
        })
        
        centerTextField?.snp.makeConstraints({ (make) in
            
            make.left.equalTo((leftIconView?.snp.right)!).offset(10);
            make.top.right.bottom.equalTo(0);
        })
    }
    
    // MARK:UITextFieldDelegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        leftImageView?.isHighlighted = true;
        
        return (self.delegate?.loginTextFieldShouldBeginEditing(self))!;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        leftImageView?.isHighlighted = false;
        self.delegate?.loginTextFieldDidEndEditing(self);
    }
    
    

}
