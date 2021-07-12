//
//  ContentVC.swift
//  NotesApp
//
//  Created by DCS on 12/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ContentVC: UIViewController {

    
    var openFile = ""
    
    private let myTextField:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Add Notes"
        textfield.textAlignment = .center
        textfield.borderStyle = .roundedRect
        textfield.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        textfield.font = .boldSystemFont(ofSize: 25)
        textfield.textColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        return textfield
    }()
    
    private let myTextView:UITextView = {
        let textview = UITextView()
        textview.textAlignment = .center
        textview.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        textview.textColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        textview.font = .systemFont(ofSize: 20)
        textview.layer.cornerRadius = 6
        return textview
    }()
    
    private let SaveButton:UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(SaveButtonTapped), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        button.layer.cornerRadius = 6
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.addSubview(myTextField)
        view.addSubview(myTextView)
        view.addSubview(SaveButton)
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg12.jpg")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)

        
        if openFile != ""{
            myTextField.text = openFile.components(separatedBy: ".").first
            myTextField.isEnabled = false
            
            let filepath = getDocDir().appendingPathComponent(openFile)
            
            do{
                let content = try String(contentsOf: filepath)
                myTextView.text = content
            }
            catch
            {
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let vw=view.frame.width
        myTextField.frame = CGRect(x: 50, y: 150, width:vw - 100, height: 50)
        myTextView.frame = CGRect(x: 50, y: 215, width: vw - 100, height: 200)
        SaveButton.frame = CGRect(x: 50, y: 430, width: vw - 100, height: 60)
    }
    
    @objc private func SaveButtonTapped()
    {
        let name = myTextField.text!
        let content = myTextView.text!
        
        let filepath = getDocDir().appendingPathComponent("\(name).txt")
        do
        {
            try content.write(to: filepath, atomically: true, encoding: .utf8)
            
            let fetchContent = try String(contentsOf: filepath)
            print("saved: \(fetchContent)")
            
            myTextField.text = ""
            myTextView.text = ""
            
            let alert = UIAlertController(title: "success", message: "File Sucessfully Created", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Done", style: .cancel))
            present(alert, animated: true)
            let vc = FileVC()
            navigationController?.pushViewController(vc, animated: true)

        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    private func getDocDir() -> URL{
        let  paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        print("Doc Dir: \(paths[0])")
        return paths[0]
    }
    
    
    
}
