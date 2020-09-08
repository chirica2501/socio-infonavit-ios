//
//  CarteraCell.swift
//  socio-infonavit-ios
//
//  Created by Ricardo Granja on 07/09/20.
//  Copyright © 2020 Ricardo Granja. All rights reserved.
//

import UIKit

class CarteraCell: UITableViewCell {

    static let nameCell = "CarteraCell"
    @IBOutlet weak var benefistCollection: UICollectionView!
    @IBOutlet weak var titleWallet: UILabel!
    var lockedsBenevits: [LockedBenevits] = []
    var unlockedsBenevits: [UnlockedBenevits] = []
    var typeCartera: Int = -1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        benefistCollection.dataSource = self
        benefistCollection.delegate = self
        benefistCollection.register(UINib.init(nibName: LockedCell.nameCell, bundle: nil), forCellWithReuseIdentifier: LockedCell.nameCell)
        benefistCollection.register(UINib.init(nibName: UnlockedCell.nameCell, bundle: nil), forCellWithReuseIdentifier: UnlockedCell.nameCell)
    }
    
    func setTypeCartera(id: Int, lockedsBenevits: [LockedBenevits], unlockedsBenevits: [UnlockedBenevits]) {
        self.lockedsBenevits = lockedsBenevits.filter({ benevit in
            return id == benevit.wallet.id
        })
        self.unlockedsBenevits = unlockedsBenevits.filter({ benevit in
            return id == benevit.wallet.id
        })
    }
}

extension CarteraCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lockedsBenevits.count + unlockedsBenevits.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let lockedCell = collectionView.dequeueReusableCell(withReuseIdentifier: LockedCell.nameCell, for: indexPath) as! LockedCell
        let unlockedCell = collectionView.dequeueReusableCell(withReuseIdentifier: UnlockedCell.nameCell, for: indexPath) as! UnlockedCell
        
        if indexPath.row >= lockedsBenevits.count {
            unlockedCell.descriptionTitle.text = unlockedsBenevits[indexPath.row - lockedsBenevits.count].title
            unlockedCell.territories.text = unlockedsBenevits[indexPath.row - lockedsBenevits.count].territories[0].name
            Image.downloadImage(url: unlockedsBenevits[indexPath.row - lockedsBenevits.count].ally.mini_logo_full_path, completion: { (image, error) in
                DispatchQueue.main.async {
                    unlockedCell.imageUnlocked.image = image
                    unlockedCell.imageUnlocked.image?.draw(in: CGRect(x: 0.0, y: 0.0, width: 140, height: 62.5))
                }
            })
            return unlockedCell
        }
        else {
            if lockedsBenevits.count - 1 < -1 {
                Image.downloadImage(url: lockedsBenevits[indexPath.row].vector_full_path, completion: { (image, error) in
                    DispatchQueue.main.async {
                        lockedCell.imageLocked.image = image
                        lockedCell.imageLocked.image?.draw(in: CGRect(x: 0.0, y: 0.0, width: 140, height: 164.5))
                    }
                })
            }
        }
        
        return lockedCell
    }
}
//gerardo@nextia.mx
//securepassword
