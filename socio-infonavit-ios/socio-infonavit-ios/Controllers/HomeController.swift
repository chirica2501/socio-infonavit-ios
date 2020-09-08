//
//  HomeController.swift
//  socio-infonavit-ios
//
//  Created by Ricardo Granja on 07/09/20.
//  Copyright © 2020 Ricardo Granja. All rights reserved.
//

import UIKit
import SideMenu

class HomeController: UIViewController {

    @IBOutlet var tableCartera: UITableView!
    var carteras: [Cartera] = []
    var lockedsBenevits: [LockedBenevits] = []
    var unlockedsBenevits: [UnlockedBenevits] = []
    var menu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        addNavBarImage()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setupUI() {
        navigationController?.navigationBar.barTintColor = UIColor(red: 236/255, green: 80/255, blue: 86/255, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        menu = SideMenuNavigationController(rootViewController: MenuListController())
   
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
        
        tableCartera.register(UINib.init(nibName: CarteraCell.nameCell, bundle: nil), forCellReuseIdentifier: CarteraCell.nameCell)
        tableCartera.estimatedRowHeight = UITableView.automaticDimension
        tableCartera.rowHeight = 200
        tableCartera.tableFooterView = UIView()
        CarteraRouter.getCartera() {  (data, error) in
            if let _ = error {
                let alert = UIAlertController(title: "Error", message: "Error al mostrar la información", preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true)
                
                
            }
            self.carteras = data
        }
        BenevitsRouter.getLockedBenevits(compilation: { (data, error) in
            if let _ = error {
                let alert = UIAlertController(title: "Error", message: "Error al mostrar la información", preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true)
                
                
            }
            self.lockedsBenevits = data
            DispatchQueue.main.async {
                self.tableCartera.reloadData()
            }
        })
        BenevitsRouter.getUnlockedBenevits(compilation: { (data, error) in
            if let _ = error {
                let alert = UIAlertController(title: "Error", message: "Error al mostrar la información", preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true)
                
                
            }
            self.unlockedsBenevits = data
        })
        
    }
    
    @IBAction func addTapped() {
        present(menu!, animated: true)
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
        return self.carteras.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarteraCell.nameCell, for: indexPath) as! CarteraCell
        
        cell.titleWallet.text = self.carteras[indexPath.row].name
        cell.setTypeCartera(id: self.carteras[indexPath.row].id, lockedsBenevits: self.lockedsBenevits, unlockedsBenevits: self.unlockedsBenevits)
        cell.benefistCollection.reloadData()
        
        return cell
    }
}

class MenuListController: UITableViewController {
    let items = ["Benevits", "Cerrar Sesión"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor(red: 236/255, green: 80/255, blue: 86/255, alpha: 1.0)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row]
        cell.backgroundColor = UIColor(red: 236/255, green: 80/255, blue: 86/255, alpha: 1.0)
        cell.textLabel?.tintColor = UIColor.white
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            LoginRouter.deleteLogout(compilation: { status, error in
                if status {
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "Cerrar Sesión", message: "¿Desea cerrar la sesión?", preferredStyle: .alert)
                        
                        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
                        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                        self.present(HomeController(), animated: true)
                            
                        }))
                        
                    }
                }
            }
        )}
    }
}



// gerardo@nextia.mx
// securepassword
