//
//  Benefits2Cell.swift
//  socio-infonavit-ios
//
//  Created by Ricardo Granja on 07/09/20.
//  Copyright © 2020 Ricardo Granja. All rights reserved.
//

import UIKit

class UnlockedCell: UICollectionViewCell {

    static let nameCell = "UnlockedCell"
    @IBOutlet weak var imageUnlocked: UIImageView!
    @IBOutlet weak var descriptionTitle: UILabel!
    @IBOutlet weak var territories: UILabel!
    @IBOutlet weak var background: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
