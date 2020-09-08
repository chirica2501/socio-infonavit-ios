//
//  HomeController.swift
//  socio-infonavit-ios
//
//  Created by Ricardo Granja on 07/09/20.
//  Copyright © 2020 Ricardo Granja. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet var tableCartera: UITableView!
     var i = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        addNavBarImage()
        setupUI()
        
    }
    
    func setupUI() {
        navigationController?.navigationBar.barTintColor = UIColor(red: 236/255, green: 80/255, blue: 86/255, alpha: 1.0)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.bookmarks, target: self, action: #selector(addTapped))
        self.navigationController?.navigationBar.tintColor = UIColor.white
        tableCartera.register(UINib.init(nibName: CarteraCell.nameCell, bundle: nil), forCellReuseIdentifier: CarteraCell.nameCell)
        tableCartera.estimatedRowHeight = UITableView.automaticDimension
        tableCartera.rowHeight = 150
        tableCartera.tableFooterView = UIView()
    }
    
    @objc func addTapped(sender: AnyObject) {
        print("Tap")
    }
    
    func addNavBarImage() {
           
           let navController = navigationController!
           
           let image = #imageLiteral(resourceName: "logo")
           let imageView = UIImageView(image: image)
           
           let bannerWidth = navController.navigationBar.frame.size.width
           let bannerHeight = navController.navigationBar.frame.size.height
           
           let bannerX = bannerWidth / 2 - image.size.width / 2
           let bannerY = bannerHeight / 2 - image.size.height / 2
           
           imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
           imageView.contentMode = .scaleAspectFit
           
           navigationItem.titleView = imageView
       }

}

extension HomeController: UITableViewDataSource,UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarteraCell.nameCell, for: indexPath) as! CarteraCell
        //let user = User.shared
        CarteraRouter.getCartera() { (d,e) in
            
        }
        cell.titleWallet.text = "s"
        i += 1
        
        return cell
    }
    
    
}
// gerardo@nextia.mx
//securepassword
