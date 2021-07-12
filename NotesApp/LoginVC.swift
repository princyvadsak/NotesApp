//
//  LoginVC.swift
//  NotesApp
//
//  Created by DCS on 12/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    private let usernameTextField:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Username"
        textfield.textAlignment = .center
        textfield.borderStyle = .roundedRect
        textfield.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        textfield.font = .boldSystemFont(ofSize: 25)
        textfield.textColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        return textfield
    }()
    
    private let passwordTextField:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Password"
        textfield.textAlignment = .center
        textfield.borderStyle = .roundedRect
        textfield.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        textfield.textColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        textfield.font = .boldSystemFont(ofSize: 25)
        textfield.isSecureTextEntry = true
        return textfield
    }()
    
    private let mybutton:UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.layer.cornerRadius = 6
       
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(mybutton)
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg8.jpg")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)

        
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let vw=view.frame.width
        usernameTextField.frame = CGRect(x: 20, y: 200, width:vw-40, height: 50)
        passwordTextField.frame = CGRect(x: 20, y: 260, width: vw - 40, height: 50)
        mybutton.frame = CGRect(x: 20, y: 370, width: vw - 40, height: 60)
        
        
    }
    
    let username = "Admin"
    let password = "admin"
    @objc func loginTapped(){
        if username == usernameTextField.text! && password == passwordTextField.text! {
            UserDefaults.standard.set(usernameTextField.text!, forKey: "email")
            let vc = FileVC()
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let alert = UIAlertController(title: "Alert!", message: "Email and Password didn't match", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    }
}

