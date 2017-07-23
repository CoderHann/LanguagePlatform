//
//  LPLoginHallController.swift
//  LanguagePlatform
//
//  Created by roki on 2017/4/17.
//  Copyright © 2017年 CoderHann. All rights reserved.
//

import UIKit
import Alamofire


class LPLoginHallController: LPBaseViewController,LoginTextFieldDelegate {
    
    var showContentView: UIView?
    var userImageView: UIImageView?
    var actionContentView: UIView?
    var accountTextField: LPLoginTextField?
    
    var passwdTextField: LPLoginTextField?
    var forgetPasswdLabel: UILabel?
    var registerAccountLabel: UILabel?
    
    var loginBtn: UIButton?
    
    var bottomContent: UIView?
    var changeBtn: UIButton?
    
    // MARK: lifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setup();
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setup() {
        
        showContentView = UIView.init();
        self.view.addSubview(showContentView!);
        
        userImageView = UIImageView.init();
        userImageView?.image = UIImage.init(named: "lp_login_deafualtIcon");
        showContentView?.addSubview(userImageView!);
        
        actionContentView = UIView.init();
        self.view.addSubview(actionContentView!);
        
        
        accountTextField = LPLoginTextField.init(normalImage: "lp_login_accountNormalIcon", highlightImage: "lp_login_accountSelectedIcon");
        actionContentView!.addSubview(accountTextField!);
        accountTextField?.centerTextField?.placeholder = "请输入您的账号";
        accountTextField?.delegate = self;
        
        passwdTextField = LPLoginTextField.init(normalImage: "lp_login_passwdNormalIcon", highlightImage: "lp_login_passwdSelectedIcon");
        actionContentView!.addSubview(passwdTextField!);
        passwdTextField?.centerTextField?.placeholder = "请输入密码";
        passwdTextField?.centerTextField?.isSecureTextEntry = true;
        passwdTextField?.delegate = self;
        
        
        forgetPasswdLabel = UILabel.init();
        forgetPasswdLabel?.font = UIFont.systemFont(ofSize: 13);
        forgetPasswdLabel?.textColor = UIColor.LPMainColor;
        forgetPasswdLabel?.text = "忘记密码?";
        forgetPasswdLabel?.textAlignment = NSTextAlignment.right;
        forgetPasswdLabel?.isUserInteractionEnabled = true;
        actionContentView?.addSubview(forgetPasswdLabel!);
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(forgetPassword));
        forgetPasswdLabel?.addGestureRecognizer(tapGesture);
        
        
        let loginBtn = UIButton.init();
        loginBtn.setTitle("登录", for: UIControlState.normal);
        loginBtn.setTitleColor(UIColor.white, for: UIControlState.normal);
        loginBtn.setTitleColor(UIColor.colorWithAlpha(red: 255, green: 255, blue: 255, alpha: 0.5), for: UIControlState.disabled);
        loginBtn.setTitleColor(UIColor.colorWithAlpha(red: 255, green: 255, blue: 255, alpha: 0.5), for: UIControlState.highlighted);
        let normalImage = UIImage.init(named: "lp_login_btnBackground");
        loginBtn.setBackgroundImage(normalImage?.resizableImage(withCapInsets: UIEdgeInsets.init(top: (normalImage?.size.height)!*0.5, left: (normalImage?.size.width)!*0.5, bottom: (normalImage?.size.height)!*0.5, right: (normalImage?.size.width)!*0.5)), for: UIControlState.normal);
        loginBtn.addTarget(self, action: #selector(loginAction), for: UIControlEvents.touchUpInside);
        actionContentView?.addSubview(loginBtn);
        loginBtn.layer.cornerRadius = 22;
        loginBtn.layer.masksToBounds = true;
        
        
        registerAccountLabel = UILabel.init();
        registerAccountLabel?.font = UIFont.systemFont(ofSize: 13);
        registerAccountLabel?.textColor = UIColor.LPMainColor;
        registerAccountLabel?.text = "快速注册";
        registerAccountLabel?.textAlignment = NSTextAlignment.right;
        registerAccountLabel?.isUserInteractionEnabled = true;
        actionContentView?.addSubview(registerAccountLabel!);
        
        let tapRegister = UITapGestureRecognizer.init(target: self, action: #selector(registerAccount));
        registerAccountLabel?.addGestureRecognizer(tapRegister);
        
        
        
        
        
        
        // MARK: autoLayout
        
        showContentView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(0);
            make.top.equalTo(44);
            make.height.equalTo(200);
        })
        
        userImageView?.snp.makeConstraints({ (make) in
            make.width.height.equalTo(100);
            make.center.equalTo(showContentView!);
        })
        
        actionContentView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(0);
            make.top.equalTo((showContentView?.snp.bottom)!);
            make.bottom.equalTo(0);
        })
        
        accountTextField?.snp.makeConstraints { (make) in
            make.top.equalTo(0);
            make.left.equalTo(35);
            make.right.equalTo(-35);
            make.height.equalTo(40);
            
        }
        
        passwdTextField?.snp.makeConstraints({ (make) in
            make.top.equalTo((accountTextField?.snp.bottom)!).offset(1);
            make.width.equalTo(accountTextField!);
            make.height.equalTo(accountTextField!);
            make.left.equalTo(accountTextField!);
            
        })
        
        
        forgetPasswdLabel?.snp.makeConstraints({ (make) in
            make.height.equalTo(20);
            make.width.equalTo(100);
            make.top.equalTo((passwdTextField?.snp.bottom)!).offset(5);
            make.right.equalTo(passwdTextField!);
            
        })
        
        loginBtn.snp.makeConstraints { (make) in
            make.height.equalTo(44);
            make.width.equalTo(passwdTextField!);
            make.top.equalTo((forgetPasswdLabel?.snp.bottom)!).offset(30);
            make.left.equalTo(passwdTextField!);
        }
        
        registerAccountLabel?.snp.makeConstraints({ (make) in
            make.height.equalTo(20);
            make.width.equalTo(100);
            make.top.equalTo(loginBtn.snp.bottom).offset(5);
            make.right.equalTo(loginBtn);
        })
        
        
        
    }
    
    // MARK: Actions
    
    func loginAction() {
        print("loginAction!");
        // check input
        if ((accountTextField?.centerTextField?.text?.length)! < 1) {
            print("账号为空")
            return;
        }
        
        LPNetEngine.requestLogin(email: "hyt163mail@163.com", password: "123456").jsonResponse { (response, isSuccess) in
            if isSuccess {
                
                
                print("login success!");
            } else {
                print("login failed!");
            }
        }
        
    }
    
    func registerAction() {
        print("register");
        
        // check input
        if (passwdTextField?.centerTextField?.text?.length)! < 1 {
            print("账号为空");
            
        }
    }
    func forgetPassword() {
        print("goto forgetPassword!");
        LPNetEngine.requestRegister(email: "hyt163mail@163.com", nickName: "rokiHann", password: "123456").jsonResponse { (response,isSuccess) in
            
            if isSuccess {
                
                print("register success!");
            } else {
                print("register fialed!");
            }
        }
    }
    
    func registerAccount() {
        let registerVC = LPRegisterMainController.init();
        
        
        self.navigationController?.pushViewController(registerVC, animated: true);
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//        self.view.endEditing(true);
        
        endFillInformation();
        
    }
    
    
    func startFillInformation() {
        
        actionContentView?.snp.updateConstraints({ (actionView) in
            actionView.top.equalTo((showContentView?.snp.bottom)!).offset(-100);
        })
        
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded();
            self.userImageView?.alpha = 0.0;
        }
    }
    
    func endFillInformation() {
        actionContentView?.snp.updateConstraints({ (actionView) in
            actionView.top.equalTo((showContentView?.snp.bottom)!).offset(0);
        })
        
        

        UIView.animate(withDuration: 0.25, animations: {
            
            self.view.layoutIfNeeded();
            self.userImageView?.alpha = 1.0;
            
        }) { (isCompletion) in
            if (isCompletion) {
                self.view.endEditing(true);
            }
            
        }
    }
    
    // MARK: LoginTextFieldDelegate
    func loginTextFieldShouldBeginEditing(_ textField: LPLoginTextField) -> Bool {
        startFillInformation();
        return true;
    }
    func loginTextFieldDidEndEditing(_ textField: LPLoginTextField) {
        
    }
    

}
