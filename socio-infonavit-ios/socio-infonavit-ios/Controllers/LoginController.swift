//
//  ViewController.swift
//  socio-infonavit-ios
//
//  Created by Ricardo Granja on 07/09/20.
//  Copyright © 2020 Ricardo Granja. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var txtF_email: UITextField!
    @IBOutlet weak var txtF_password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
           enterButton.layer.cornerRadius = 18
           enterButton.isEnabled = false
           setupAddTargetIsNotEmptyTextFields()
       }
       
       func setupAddTargetIsNotEmptyTextFields() {
        txtF_email.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                    for: .editingChanged)
        txtF_password.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                    for: .editingChanged)
       }
       
       @objc func textFieldsIsNotEmpty(sender: UITextField) {
           sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
           guard
               let email = txtF_email.text, !email.isEmpty,
               let password = txtF_password.text, !password.isEmpty
               else {
                self.enterButton.isEnabled = false
                enterButton.backgroundColor = UIColor(red: 159/255, green: 159/255, blue: 159/255, alpha: 1.0)
                return
                
        }
        enterButton.backgroundColor = UIColor(red: 236/255, green: 80/255, blue: 86/255, alpha: 1.0)
        enterButton.isEnabled = true
       }
    
    @IBAction func loginAccess(_ sender: Any) {
        guard
            let email = txtF_email.text, !email.isEmpty,
            let password = txtF_password.text, !password.isEmpty
            else { return }
        
        LoginRouter.postLogin(email: email, password: password, compilation: { (access, error) in
            if access {
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "toHome", sender: nil)
                }
            }
            else {
                DispatchQueue.main.async {
                let alert = UIAlertController(title: "Usuario o Contraseña incorrecto", message: "Intente nuevamente", preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true)
                }
            }
        })
    }
}
//gerardo@nextia.mx
//securepassword
