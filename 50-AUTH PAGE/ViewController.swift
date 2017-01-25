//
//  ViewController.swift
//  50-AUTH PAGE
//
//  Created by Sagaya Abdulhafeez on 25/01/2017.
//  Copyright © 2017 Sagaya Abdulhafeez. All rights reserved.
//

import UIKit
import Material


class ViewController: UIViewController {
    
    let bgImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bg")
        image.alpha = 0.4
        return image
    }()
    
    let headerText: UILabel = {
       let label = UILabel()
        label.text = "EXAMPLE"
        return label
    }()
    let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("FORGOT PASSWORD", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    let signinButton: RaisedButton = {
       let btn = RaisedButton()
        btn.backgroundColor = .black
        btn.setTitle("SIGN IN ", for: .normal)
        btn.pulseColor = .gray
        btn.shadowColor = .gray
        btn.shadowRadius = 5
        
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.setTitleColor(.white, for: .normal)
        btn.width = 200
        return btn
        
    }()
    
    let emailTextField = ViewController.setupTextViews(placeholder: "E-mail", type: .emailAddress, secured: false, image: "Message")
    let passwordTextField = ViewController.setupTextViews(placeholder: "Password", type: .emailAddress, secured: true, image: "Password")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red:0.99, green:0.99, blue:0.99, alpha:1.0)
        let signinWithText = UILabel()
        signinWithText.text = "SIGN IN WITH"
        signinWithText.font = UIFont.boldSystemFont(ofSize: 14)
        signinWithText.textAlignment = .center
        
        let socialLinks = UILabel()
        socialLinks.textAlignment = .center
        let buttomView = UIView()
        buttomView.backgroundColor = UIColor(red:0.53, green:0.53, blue:0.54, alpha:1.0)
        buttomView.alpha = 0.6
        
        let buttomViewText = UILabel()
        buttomViewText.textAlignment = .center
        
        var tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.signup))
        buttomViewText.isUserInteractionEnabled = true
        buttomViewText.addGestureRecognizer(tap)
        
        view.addSubview(bgImage)
        view.addSubview(headerText)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(signinButton)
        view.addSubview(signinWithText)
        view.addSubview(socialLinks)
        view.addSubview(buttomView)
        view.addConstraintsWithFormat("H:|[v0]|", views: bgImage)
        view.addConstraintsWithFormat("V:|[v0]|", views: bgImage)
        view.addConstraintsWithFormat("H:|-30-[v0]", views: headerText)
        view.addConstraintsWithFormat("H:|-30-[v0]-30-|", views: emailTextField)
        view.addConstraintsWithFormat("H:|-30-[v0]-30-|", views: passwordTextField)
        view.addConstraintsWithFormat("H:|[v0]|", views: forgotPasswordButton)
        view.addConstraintsWithFormat("H:|[v0]|", views: signinWithText)
        view.addConstraintsWithFormat("H:|[v0]|", views: socialLinks)
        view.addConstraintsWithFormat("H:|-70-[v0(250)]-50-|", views: signinButton)
        view.addConstraintsWithFormat("H:|[v0]|", views: buttomView)
        view.addConstraintsWithFormat("V:|-100-[v0]-20-[v1(30)]-40-[v2(30)]-20-[v3]-30-[v4(40)]-60-[v5]-20-[v6]", views: headerText,emailTextField,passwordTextField,forgotPasswordButton,signinButton,signinWithText,socialLinks)
        view.addConstraintsWithFormat("V:[v0(40)]|", views: buttomView)
        buttomView.addSubview(buttomViewText)
        buttomView.addConstraintsWithFormat("H:|[v0]|", views: buttomViewText)
        buttomView.addConstraintsWithFormat("V:|[v0]|", views: buttomViewText)
        
        //attributed text
        var labelAttribute = NSMutableAttributedString(string: "SIGN", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 50)])
        labelAttribute.append(NSAttributedString(string: " IN", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 50),NSForegroundColorAttributeName: UIColor(red:0.00, green:0.85, blue:0.29, alpha:1.0)]))
        
        let socialAttr = NSMutableAttributedString()
        let attach = NSTextAttachment()
        attach.image = UIImage(named: "Facebook")
        attach.bounds = CGRect(x: -40, y: -3, width: 25, height: 25)
        socialAttr.append(NSAttributedString(attachment: attach))
        let attach1 = NSTextAttachment()
        attach1.image = UIImage(named: "Twitter")
        attach1.bounds = CGRect(x: 40, y: -3, width: 25, height: 25)
        socialAttr.append(NSAttributedString(attachment: attach1))

        socialLinks.attributedText = socialAttr
        
        var signupAttr = NSMutableAttributedString(string: "If you don't have an account sign up here", attributes: [NSForegroundColorAttributeName: UIColor(red:0.76, green:0.76, blue:0.76, alpha:1.0), NSFontAttributeName: UIFont.boldSystemFont(ofSize: 12)])
        signupAttr.append(NSAttributedString(string: "  SIGN UP HERE", attributes: [NSForegroundColorAttributeName: UIColor.white,NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)]))
        buttomViewText.attributedText = signupAttr
        headerText.attributedText = labelAttribute
    }
    
    static func setupTextViews(placeholder:String,type:UIKeyboardType,secured:Bool,image:String)->TextField{
        let nameField = TextField()
        nameField.placeholder = placeholder
        nameField.textAlignment = .left
        nameField.layoutEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        nameField.clearButtonMode = .whileEditing
        nameField.dividerNormalHeight = 1.0
        nameField.leftViewMode = .always
        let imageView = UIImageView()
        let image = UIImage(named: image)
        imageView.image = image;
        nameField.textColor = .white
        nameField.leftView = imageView;
        nameField.keyboardType = type
        nameField.isSecureTextEntry = secured
        nameField.dividerNormalColor = .black
        nameField.placeholderNormalColor = UIColor.gray
        nameField.dividerActiveColor = .black
        nameField.placeholderActiveColor = .black
        return nameField
    }
    func signup(sender:UITapGestureRecognizer){
        print("Hello there")
    }
    func injected(){
        self.loadView()
        self.viewDidLoad()
    }
}

