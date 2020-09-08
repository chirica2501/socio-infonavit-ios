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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        benefistCollection.dataSource = self
        benefistCollection.delegate = self
        benefistCollection.register(UINib.init(nibName: LockedCell.nameCell, bundle: nil), forCellWithReuseIdentifier: LockedCell.nameCell)
        benefistCollection.register(UINib.init(nibName: UnlockedCell.nameCell, bundle: nil), forCellWithReuseIdentifier: UnlockedCell.nameCell)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CarteraCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LockedCell.nameCell, for: indexPath) as! LockedCell
        
        return cell
    }
    
    
}
