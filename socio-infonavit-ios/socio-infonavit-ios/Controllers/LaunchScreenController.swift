//
//  LaunchScreenController.swift
//  socio-infonavit-ios
//
//  Created by Ricardo Granja on 07/09/20.
//  Copyright © 2020 Ricardo Granja. All rights reserved.
//

import UIKit

class LaunchScreenController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
        self.activityIndicator.isHidden = true
        Timer.scheduledTimer(withTimeInterval: 0.0, repeats: false, block: { (t) in
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
            Timer.scheduledTimer(withTimeInterval: 0.0, repeats: false, block: { (t) in
                self.activityIndicator.isHidden = true
                self.activityIndicator.stopAnimating()
                self.performSegue(withIdentifier: "toLogin", sender: nil)
            })
        })
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if self.view.frame.origin.y == .zero {
            self.view.frame.origin.y -= 100
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != .zero {
            self.view.frame.origin.y = .zero
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func didTap(_ sender: Any) {
        view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
