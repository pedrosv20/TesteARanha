//
//  ImagemCell.swift
//  TesteARanha
//
//  Created by Maria Fernanda Azolin on 30/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit

class ImagemCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var eyeImage: UIImageView!
    
    var isBlurred = false
}
