//
//  signUpViewController.swift
//  50-AUTH PAGE
//
//  Created by Sagaya Abdulhafeez on 27/01/2017.
//  Copyright © 2017 Sagaya Abdulhafeez. All rights reserved.
//

import UIKit
import Material

class signUpViewController: UIViewController{
    let bgImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bg")
        image.alpha = 0.4
        return image
    }()
    
    let backButton: RaisedButton = {
       let btn = RaisedButton()
        btn.backgroundColor = .black
        btn.pulseColor = .gray
        btn.shadowColor = .gray
        btn.shadowRadius = 5
        btn.setImage(UIImage(named: "left"), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.setTitleColor(.white, for: .normal)
        return btn
        
    }()
    
    let headerText: UILabel = {
        let label = UILabel()
        label.text = "EXAMPLE"
        return label
    }()
    let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    let signinButton: RaisedButton = {
        let btn = RaisedButton()
        btn.backgroundColor = .black
        btn.setTitle("SIGN UP ", for: .normal)
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
    let confirmPasswordTextField = ViewController.setupTextViews(placeholder: "Repeat Password", type: .emailAddress, secured: true, image: "Password")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red:0.99, green:0.99, blue:0.99, alpha:1.0)
        let signinWithText = UILabel()
        signinWithText.text = "SIGN UP WITH"
        signinWithText.font = UIFont.boldSystemFont(ofSize: 14)
        signinWithText.textAlignment = .center
        
        let socialLinks = UILabel()
        socialLinks.textAlignment = .center
        
        view.addSubview(bgImage)
        view.addSubview(headerText)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPasswordTextField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(signinButton)
        view.addSubview(signinWithText)
        view.addSubview(socialLinks)
        view.addSubview(backButton)
        view.addConstraintsWithFormat("H:|[v0]|", views: bgImage)
        view.addConstraintsWithFormat("H:|[v0(60)]", views: backButton)
        view.addConstraintsWithFormat("V:|[v0]|", views: bgImage)
        view.addConstraintsWithFormat("H:|-30-[v0]", views: headerText)
        view.addConstraintsWithFormat("H:|-30-[v0]-30-|", views: emailTextField)
        view.addConstraintsWithFormat("H:|-30-[v0]-30-|", views: passwordTextField)
        view.addConstraintsWithFormat("H:|-30-[v0]-30-|", views: confirmPasswordTextField)
        view.addConstraintsWithFormat("H:|[v0]|", views: forgotPasswordButton)
        view.addConstraintsWithFormat("H:|[v0]|", views: signinWithText)
        view.addConstraintsWithFormat("H:|[v0]|", views: socialLinks)
        view.addConstraintsWithFormat("H:|-70-[v0(250)]-50-|", views: signinButton)

        view.addConstraintsWithFormat("V:|-23-[v0(30)]-100-[v1]-20-[v2(30)]-40-[v3(30)]-40-[v4]-20-[v5]-30-[v6(40)]-60-[v7]-20-[v8]", views: backButton, headerText,emailTextField,passwordTextField,confirmPasswordTextField,forgotPasswordButton,signinButton,signinWithText,socialLinks)
        backButton.addTarget(self, action: #selector(signUpViewController.backBtn), for: .touchUpInside)
        //attributed text
        var labelAttribute = NSMutableAttributedString(string: "SIGN", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 50)])
        labelAttribute.append(NSAttributedString(string: " UP", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 50),NSForegroundColorAttributeName: UIColor(red:0.00, green:0.85, blue:0.29, alpha:1.0)]))
        
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
        
        headerText.attributedText = labelAttribute
    }
    func backBtn(){
        self.present(ViewController(), animated: true, completion: nil)
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
        present(signUpViewController(), animated: true, completion: nil)
    }
    func injected(){
        self.loadView()
        self.viewDidLoad()
    }
}


