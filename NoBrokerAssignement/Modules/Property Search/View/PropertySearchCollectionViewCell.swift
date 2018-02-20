//
//  PropertySearchCollectionViewCell.swift
//  NoBrokerAssignement
//
//  Created by Durgesh Pandey on 19/02/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import UIKit

class PropertySearchCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewCellContent: UIView!
    @IBOutlet weak var imageViewPropertyThumbnail: UIImageView!
    @IBOutlet weak var labelPropertyTitle: UILabel!
    @IBOutlet weak var labelPropertySubTitle: UILabel!
    @IBOutlet weak var labelPropertyPrice: UILabel!
    @IBOutlet weak var labelPropertyFurnishing: UILabel!
    @IBOutlet weak var labelPropertyBathrooms: UILabel!
    @IBOutlet weak var labelPropertyBuiltUpArea: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
