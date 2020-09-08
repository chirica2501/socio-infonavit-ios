//
//  Benefits1Cell.swift
//  socio-infonavit-ios
//
//  Created by Ricardo Granja on 07/09/20.
//  Copyright © 2020 Ricardo Granja. All rights reserved.
//

import UIKit

class LockedCell: UICollectionViewCell {

    static let nameCell = "LockedCell"
    @IBOutlet weak var imageLocked: UIImageView!
    @IBOutlet weak var iWantButton: UIButton!
    @IBOutlet weak var background: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    func setupUI() {
        self.backgroundColor = UIColor.red
        iWantButton.layer.cornerRadius = 5
        iWantButton.backgroundColor = UIColor(red: 236/255, green: 80/255, blue: 86/255, alpha: 1.0)
        iWantButton.setTitleColor(UIColor.white, for: .normal)
    }
}
